require 'csv'

namespace :publish_content do
  desc "Publish Content"
  task update_draft_content: :environment do
    logger = Logger.new "#{Rails.root}/log/status_change_error.log"
    CSV.open("#{Rails.root}/log/status_change_report.csv", 'wb') do |csv|
      csv << %w[id published_date date_today status]
      date_today = DateTime.current.to_date
      Content.draft.where("published_date <= ?", date_today).each do |content|
        begin
         content.update(status: :published)
         csv << [content.id, content.published_date, date_today, content.status]
        rescue => e
          error_message = "Error occured : #{e.message}, Content: #{content.id}"
          puts "#{error_message}"
          logger.info error_message
        end
      end
    end
  end
end