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
			
		end

end