# Chatty 

Chatty is open-source demo chat system built to recieve many requests using queue jobs and redis.

## Requirements

Chatty requires Ruby 2.5.x, a host application built on Rails 5.2, Mysql database v5.7.x, Elasticsearch v7.1.1, Redis v5, Sidekiq queue worker, Rspec gem for testing, And finally you don't have to install these requirements because this repo is dockerized. 

## Before we start

This project uses .env file, So you have to rename .env.example to .env, And fill desired values for variables.

Notes: 

* `Both docker-compose.yml and Rails app use this configuration file so you don't have to write this twice`.
* `Make sure there is no services are using these ports 3306, 9200, 3000, 6379, So you have to stop these services or kill the process run on the port.`

### Getting Started

First, clone this project to the desired directory then navigate to this location.

Second, Run docker-compose using:

    docker-compose up
It will take some time to get the project's dependancies, now your rails app is up and running.

Third, Open new terminal or tab , To migrate your development database with:

    docker-compose run web rails db:migrate


If all went according to plan, you should be able to see you can create your first application at: (http://localhost:3000/applications), this is API project only so don't need to add API to route.

* If you got this error "max virtual memory areas vm.max_map_count [65530] is too low" you can run this command as adminstrator `sysctl -w vm.max_map_count=262144`.

To stop the docker container, press `CTRL-C`.

## Configuration

Chatty's settings can be configured by adding variables to .env file then read it within application, example:

* `MYSQL_ROOT_PASSWORD=root`

### Search engine

You can search messages within specific chat:
Project uses elasticsearch to enhance message searching.

#### Test

To use Test Cases:

You can start running test cases by simply migrating testing db with:

    docker-compose run web bundle exec rake db:create RAILS_ENV=test

Then : 

    docker-compose run web rails db:migrate RAILS_ENV=test

You will then can run test with:

    docker-compose run web bundle exec rspec

You can rollback testing db with:

    docker-compose run web rails db:rollback RAILS_ENV=test


#### Tips

You can get rid of:
    
    docker-compose run web

by making an alias it will save you time xD.

* `Included in this repo Postman Collection and Postman Env.`
* `Included brain-storm.txt that I follow while development.`

Feedback wanted
---------------

Is there something wrong, unclear, Or there is a away to make the code more DRY? Please get in touch so we can make it better. If you can contribute improved text or code, I'd really appreciate it.

Contacts
---------------
You can contact me on gmail:
[MohamedAshraf](mailto:mohammed.ashraaf.ma@gmail.com): mohammed.ashraaf.ma@gmail.com 