class FileParser

	attr_reader :file, :error_msg, :raw_text, :pages,
							:page_separator

	def initialize(file, log)
		@file = file
		@error_msg = ""
		@raw_text = ""
		@log = log
		@pages = []
		begin
			parse_file
		rescue => e
			@error_msg = e.message
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
		@page_separator = @raw_text.lines.last + @raw_text.lines.first
		@pages = @raw_text.split(page_separator).compact
	end

	def parse_pages
		@pages.each do |page|
			@page = page
			parse_page
		end
	end

	def parse_page
		@lines_at_page = @page.lines.count
		data = { program_name: @page_separator.lines.last.strip,
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
		puts data
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
		VotingSummary.find_or_create_by(name: vs_name).id || 0
	end

end
