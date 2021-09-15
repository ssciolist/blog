* Ruby version: 2.6.3
* Postgres version: 
* Node version:

# Environment
This project requires the following environment variables be set:
* For database image:
    * ENV['POSTGRES_USER']
    * ENV['POSTGRES_PASSWORD']
* To set author
    * ENV['PRIMARY_USER']
    * ENV['PRIMARY_USER_PW']

# Docker startup
1. Start a local postgres instance with password and user matching your environment values 
- `docker run --name blog_db -e POSTGRES_PASSWORD=[ENV['POSTGRES_PASSWORD]] -e POSTGRES_USER=[ENV['POSTGRES_USER']] -d postgres`


# README to-do

Things you may want to cover:

* System dependencies

* Configuration

* Database creation & initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
