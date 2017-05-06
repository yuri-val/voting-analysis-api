require 'fileutils'

namespace :parser do
  desc "Parse pdf files from public/pdfs to DB and move them to public/pdfs/processed"
  task run: :environment do
    rr = Rails.root
    FileUtils.chdir(rr.to_s)
    FileUtils.mkdir_p(rr.join('public','pdfs','processed').to_s)
    log = ActiveSupport::Logger.new(rr.join('log','file_parser.log').to_s)
    start_time = Time.now
    log.info "Task started at #{start_time}"

    pdfs = Dir[rr.join('public','pdfs','*.pdf').to_s]
    pdfs_count = pdfs.size
    pdfs.each_with_index do |pdf, ind|
      puts "FILE: #{pdf}"
      name = pdf.split('/').last
      parser = FileParser.new pdf, log
      if parser.ok?
        log.info "#{ind + 1}/#{pdfs_count} -- #{name} -- OK"
        FileUtils.mv pdf, rr.join('public','pdfs', 'processed', name).to_s
      else
        log.info "#{ind + 1}/#{pdfs_count} -- #{name} -- FAIL.\n #{parser.error_msg}"
      end
    end

    end_time = Time.now
    duration = (end_time - start_time) / 1.minute
    log.info "Task finished at #{end_time} and last #{duration} minutes."
    log.close

  end
end
