* Ruby version: 2.6.3
* Postgres version: 13.3
* Node version: 14.17.6

# Environment
This project requires the following environment variables be set:
* For database image:
    * ENV['POSTGRES_USER']
    * ENV['POSTGRES_PASSWORD']
* To set author
    * ENV['PRIMARY_USER']
    * ENV['PRIMARY_USER_PW']

# Docker startup
## In dev
1. `docker compose build`
2. `docker compose up`


# README to-do

Things you may want to cover:

* Configuration

* Database creation & initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
