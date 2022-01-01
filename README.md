# Dive Map Book API

**This repository is under development.**

Dive Map Book is an application of the collection of dive maps, and this repository is backend service for it. (client repo is [here](https://github.com/tessai9/dive-map-client))  
The API specification is managed at [another repository](https://github.com/tessai9/dive-map-api-spec).  

## Version

- Ruby 2.7.1
- Ruby on Rails 6.1.4
- PostgreSQL 9.6.22
- OpenAPI 3.0.0

## How to Start

You need to install Docker, and run following commands.

```
$ docker-compose build
$ docker-compose run app bin/rails db:create
$ docker-compose run app bin/rails db:migrate
$ docker-compose run app bin/rails db:seed
$ docker-compose up
```

## URLs

- API : http://localhost:3000
- Swagger UI : http://localhost:8081
