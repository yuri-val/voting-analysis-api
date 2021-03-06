class FileParser

  attr_reader :file, :error_msg, :raw_text, :pages,
  						:page_separator

  attr_reader :vote_header, :vote_table

  def initialize(file, log)
    @file = file
    @error_msg = ""
    @raw_text = ""
    @log = log
    @pages = []
    begin
      parse_file
    rescue => e
      @error_msg = e.inspect
    end
  end

  def ok?
    @error_msg.empty?
  end

  private

  @page = nil
  @lines_at_page = 0
  @session = ""
  @table = ""

  def parse_file
    extract_raw_text
    split_by_pages
    parse_pages
  end

  def extract_raw_text
    reader = PDF::Reader.new(@file)
    reader.pages.each do |page|
      @raw_text << page.text << "\n"
    end
  end

  def split_by_pages
    @page_separator = @raw_text.lines.last
    @pages = @raw_text.split(page_separator.strip).compact
  end

  def parse_pages
    count = @pages.size
    @pages.each_with_index do |page, ind|
      puts "PAGE #{ind + 1}/#{count}"
      @page = page
      parse_page
      create_voting
    end
  end

  def parse_page
    @lines_at_page = @page.lines.count
    @vote_header = { program_name: program_name,
      department_name: department_name,
      session: session,
      date: date,
      number: number,
      content: content,
      title: title,
      summary_yea: summary_yea,
      summary_nay: summary_nay,
      summary_abstained: summary_abstained,
      not_voted: not_voted,
      absent: absent,
    	voting_summary_id: voting_summary_id }
  end

  def parse_table(voting)
    @vote_table = TableParser.new(voting, @table).parsed_table
  end

  def create_voting

    voting = Voting.find_or_create_by(@vote_header)
    parse_table voting
    @vote_table.each do |vote_row|
      VotingRow.find_or_create_by(vote_row)
    end

  end

  def cut_page(from)
    @page = @page.lines[from..@lines_at_page].join("")
  end

  def last_value_of_line(splitter = '-')
    value = ""
    @page.lines.each_with_index do |line, ind|
      line.strip!
      unless line.empty?
        value = line.split(splitter).last.strip
        cut_page(ind + 1)
        break
      end
    end
    value
  end

  def program_name
    value = ""
    @page.lines.each_with_index do |line, ind|
      line.strip!
      unless line.empty?
        value = line
        cut_page(ind + 1)
        break
      end
    end
    value
  end

  def department_name
    value = ""
    @page.lines.each_with_index do |line, ind|
      line.strip!
      if !line.empty? and !(line == @page_separator.lines.last.strip)
        value = line
        cut_page(ind + 1)
        break
      end
    end
    value
  end

  def session
    @page.lines.each_with_index do |line, ind|
      line.strip!
      unless line.empty?
        @session = line
        cut_page(ind + 3)
        break
      end
    end
    @session
  end

  def date
    s_date = @session.split(' ').last
    Date.strptime(s_date,'%d.%m.%y')
  end

  def number
    @session.split(' ').first.to_i
  end

  def content
    value = ""
    @page.lines.each_with_index do |line, ind|
      if line.strip.start_with?("№: ")
        cut_page(ind)
        break
      end
      value << line
    end
    value.strip!
  end

  def title
    value = ""
    @page.lines.each_with_index do |line, ind|
      if (line.strip =~ /№[^:]/) == 0
        cut_page(ind)
        break
      end
      value << line
    end
    extract_table
    value.strip!
  end

  def extract_table
    @table = ""
    @page.lines.each_with_index do |line, ind|
      if (line.strip =~ /ПІДСУМКИ ГОЛОСУВАННЯ/) == 0
        cut_page(ind + 1)
        break
      end
      @table << line
    end
    cut_header
  end

  def cut_header
    5.times do
      next if @table.lines[0].nil?
      if @table.lines[0].strip.start_with?("№") or
          @table.lines[0].strip.start_with?("голосування") or
          @table.lines[0].strip.start_with?("Результат") or
          @table.lines[0].strip.start_with?("п/п") or
          @table.lines[0].strip.empty?
            arr = @table.lines
            arr.slice!(0)
            @table = arr.join("")
      end
    end
  end

  def summary_yea
    last_value_of_line
  end

  def summary_nay
    last_value_of_line
  end

  def summary_abstained
    last_value_of_line
  end

  def not_voted
    last_value_of_line
  end

  def absent
    last_value_of_line
  end

  def voting_summary_id
    vs_name = last_value_of_line(':').strip
    VotingSummary.find_or_create_by(name: vs_name).id
  end

end

class TableParser
  attr_reader :table, :lines_at_table, :parsed_table,
              :table_data, :voting

  def initialize(voting, table)
    @table = table
    @lines_at_table =  @table.lines.count
    @parsed_table = []
    @table_data = []
    @voting = voting
    parse
  end

  private

  @prev_str = ""
  @curr_str = ""
  @next_str = ""

  def cut_table(from)
    @table = @table.lines[from..@lines_at_table].join("")
  end

  def parse
    @table.lines.each_with_index do |line, ind|
      parse_line line, ind
    end

    extract_table_data
  end

  def parse_line(line, ind)
    @curr_str = line
    @next_str = @table.lines[ind + 1]

    data_arr = line.gsub(/(\S)([А-ЯІЇЄ])/, '\1 \2').split(/[0-9]/)
    data_arr.reject! { |s| s.strip.empty?}
    @table_data << data_arr
  end

  def extract_table_data
    for_next_left = nil
    for_next_right = nil
    @table_data.reject!(&:empty?)
    @table_data.each do |el|
      next if el.empty?

      if @table_data.last == el
        left = el[0].strip.gsub(/(\s+)([А-ЯІЇЄ])/, '\1|\2')
        process_element left, for_next_left
        next
      end

      if el.size == 1
        str = el[0]
        str_pos = str  =~ /\S/
        if str_pos > 50
          for_next_right = str.strip
        else
          for_next_left = str.strip
        end
        next
      end

      if el.size == 2
        left = el[0].strip.gsub(/(\s+)([А-ЯІЇЄ])/, '\1|\2')
        right = el[1].strip.gsub(/(\s+)([А-ЯІЇЄ])/, '\1|\2')
        process_element left, for_next_left
        process_element right, for_next_right
        for_next_left = nil
        for_next_right = nil
        next
      end
    end
  end

  def process_element(el_string, addition)
    el_string = [addition, el_string].join("|") unless addition.nil?
    values = el_string.split("|")
    values.map! { |e| e.strip }

    vote = VotingResult.find_or_create_by(name: values.last.gsub(/[\s+ ]/, " ").strip)
    values.pop

    dep = Deputy.find_or_create_by(name: values.join(" "))

    @parsed_table << {voting: voting, deputy: dep, voting_result: vote}
  end

end
