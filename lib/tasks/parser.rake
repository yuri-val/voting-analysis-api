require 'fileutils'

namespace :parser do
  desc "Parse pdf files from public/pdfs to DB and move them to public/pdfs/processed"
  task do: :environment do
    FileUtils.chdir(Rails.root.to_s)
    FileUtils.mkdir_p('public/pdfs/processed')
    log = ActiveSupport::Logger.new('log/file_parser.log')
    start_time = Time.now
    log.info "Task started at #{start_time}"

    pdfs = Dir['public/pdfs/*.pdf']
    pdfs_count = pdfs.size
    pdfs.each_with_index do |pdf, ind|
      name = pdf.split('/').last
      parser = FileParser.new pdf, log
      if parser.ok?
        log.info "#{ind + 1}/#{pdfs_count} -- #{name} -- OK"
        #FileUtils.mv pdf, "public/pdfs/processed/#{name}"
      else
        log.info "#{ind + 1}/#{pdfs_count} -- #{name} -- FAIL.\n #{parser.error_msg}"
      end
      #puts "FILE #{name}------------------------"
      #parser.pages.each_with_index do |page, n_ind|
      #  puts "----PAGE #{n_ind + 1} ----------------------------------------------"
      #  puts page
      #  break if n_ind == 4
      #end
    end

    end_time = Time.now
    duration = (start_time - end_time) / 1.minute
    log.info "Task finished at #{end_time} and last #{duration} minutes."
    log.close

  end
end
