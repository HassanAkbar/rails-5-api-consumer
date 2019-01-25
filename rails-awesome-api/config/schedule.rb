every 1.minute do # 1.minute 1.day 1.week 1.month 1.year is also supported
  rake "rake export:seeds_content"
end
#1 * * * * cd /Users/hassanakbar/Documents/GitHub/cms-api-test/super-awesome-api;  bundle exec rake export:seeds_content

#whenever --update-crontab --set environment='development'