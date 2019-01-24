require 'csv'

namespace :export do
  desc "Export Content From CSV"
  task seeds_content: :environment do
    begin
      file_path = "#{Rails.root}/data_import_center/contents.csv"
      logger = Logger.new "#{Rails.root}/data_import_center/contents.log"
      puts "No File is found at: #{file_path}" unless File.file?(file_path)
      csv_contents = CSV.read(file_path)
      csv_contents.shift # remove headers
    rescue => e
      error_message = "Error occured while reading file : #{e.message}"
      puts "#{error_message}"
      logger.info "#{error_message}"
    end
    binding.pry

    csv_contents.each.with_index(1) do |content_row, index|
      #Title,Published date,Author,Summary,Content,Status
      begin
        Content.create!(title: content_row[0], published_date: content_row[1], author: content_row[2], summary: content_row[3], content: content_row[4], status: content_row[5].downcase)
      rescue => e
        error_message = "Error occured : #{e.message}, Index: #{index} Content_Row: #{content_row}"
        puts "#{error_message}"
        logger.info error_message
      end
    end
  end
end