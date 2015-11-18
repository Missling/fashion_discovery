# Fashion Discovery

Fashion Discovery is a web application that delivers fashion content to users.

## Outline

* Current data is generated from the `Faker` gem. Data is imported into a PostgreSQL database via a seed file.
* Users are initially shown 20 board items. The randomization of board items is achieved by shuffling the data retrieved from Ruby's `will_pagination` gem.  
* Upon scrolling to the bottom of the page, an AJAX call is made to the server for the next 20 items as JSON data, passing the page as the parameter. Using `Handlebars.js`, the new contents are appended to the existing board items. 
* Each board items have the following structure: title, blurb, author, thumbnail_url, details_url. Title and blurb are truncated to show 32 words or less.
* Board items are displayed using the Masonry Javascript grid layout libary.
* Fashion Discovery is deployed to Heroku at https://desolate-chamber-1314.herokuapp.com

## Running Fashion Discovery on Local Development

* Navigate to fashion_discovery directory
* Run `bundle install` to install the Ruby gems
* Run `rake db:create` to create the database
* Run `rake db:migrate` to run the database migrations
* Run `rake db:seed` to import the development data
* Run `rails server` to start the web server
* To see application in action, open browser window and navigate to http://localhost:3000

## Heroku Deployment Instructions

* Run `heroku create` to create new application on Heroku
* Run `git remote -v` to verify that heroku was added
* Run `git push heroku master` to deploy code
* Run `heroku addons:create heroku-postgresql:hobby-dev` to create database
* Run `heroku run rake db:create`
* Run `heroku run rake db:migrate`
* Run `heroku run rake db:seed`
* Run `heroku open`
