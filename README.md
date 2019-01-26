# README
This is a library to communicate rails 5 api only project with ember.js.

## Rails Installation and Setup
Things you may want to cover:

* Ruby version  : 2.5.1 

* Rails version : ~> 5.2.0

* Project setup > 

After downloading the project change directory to rails project. 
```bash
cd rails-awesome-api/
```
* Setup your database
```bash
rails db:create 
```
* Run migrations
```bash
rails db:migrate 
 ```
* Run Server (localhost:3000)
```bash
rails s
```
## Export Content  
* Rake task takes input from the [content.csv](rails-awesome-api/data_import_center/contents.csv) file
```bash
 rails export:seeds_content
 ```
 This rake task also generates:
* [Error Log named contents.log](rails-awesome-api/log/data_import_center/)

* Important: You can update the files (add more entries but keep the mapping structure of columns same)

### Structure: 
* Column1 : Title, Column 2 : Published date, Column 3 : Author, Column 4 : Summary, Column 5 : Content, Column 6: Status

## Publish Draft Content 
```bash
rails publish_content:update_draft_content
 ```
 [Whenever](https://github.com/javan/whenever) gem is used for making cronjobs. A file [Schedule.rb](rails-awesome-api/config/schedule.rb)
 
It is set to run every minute:
```ruby
every 1.minute do
  rake "publish_content:update_draft_content"
end
```
 To add cronjob:
 ```bash
 whenever --update-crontab --set environment='development'
 ```
 To check if cronjob is added : 
  ```bash
  crontab -e
  ```
 This rake task also generates:
 * [Error Log](rails-awesome-api/log/status_change_error.log)
 * [Status Change History](rails-awesome-api/log/status_change_report.csv)



## Ember.js Installation and Setup
You can install Ember.js from [here](https://guides.emberjs.com/release/getting-started/) 
* Ember Version : (ember-cli: 3.5.1)
* Node Version  : 11.3.0


After downloading the project change directory to rails project. 
```bash
cd ember-blog-front/
```
* Run Server (localhost:4200)
```bash
ember s
```
This will display all content items.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
