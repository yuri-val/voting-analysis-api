namespace :parser do
  desc "Parse pdf files from public/pdfs to DB and move them to public/pdfs/processed"
  task do: :environment do
  	log = ActiveSupport::Logger.new('log/file_parser.log')
  	start_time = Time.now
    log.info "Task started at #{start_time}"

  	pdfs = Dir['public/pdfs/*.pdf']
  	pdfs_count = pdfs.size
  	pdfs.each_with_index do |pdf, ind|
  		parser = FileParser.new pdf, log
  		if parser.ok?
  			log.info "#{ind + 1}/#{pdfs_count} -- OK"
  		else
  			log.info "#{ind + 1}/#{pdfs_count} -- FAIL. #{parser.error_msg}"
  		end
			parser.pages.each_with_index do |page, ind|
				#puts "PAGE #{ind + 1}-----------------------------------------"
				#puts page
			end
  		 break
  	end

  	end_time = Time.now
    duration = (start_time - end_time) / 1.minute
    log.info "Task finished at #{end_time} and last #{duration} minutes."
    log.close

  end
end
