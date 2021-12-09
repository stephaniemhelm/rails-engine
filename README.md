# RAILS ENGINE LITE README

Rails Engine Lite is a Ruby on Rails Application used to expose item and merchant data.  The data is exposed through 7 different endpoints.
This application uses Ruby 2.7.2 and Rails 5.2.6.

## Application Setup 

Follow these steps from terminal:
```
cd into desired directory
git clone git@github.com:stephaniemhelm/rails-engine.git
cd rails-engine
bundle install
rails db:{create,migrate,seed}
bundle exec rspec
rails server
```
Navigate to the browser:
```
localhost:3000
```

## Requesting Database Endpoint Items

- `GET /api/v1/items`                 :requests a list of items
- `GET /api/vi/items/:id`             :requests an item from item id
- `POST /api/v1/items`                :creates an item
- `PATCH /api/v1/items/:id`           :updates an item from id
- `DESTROY /api/v1/items/id`          :destroys an item from id
- `GET /api/v1/items/:id/merchant`    :requests the merchant associated with item id

## Requesting Database Endpoint Merchants

- `GET /api/v1/merchants`             :requests a list of merchants
- `GET /api/v1/merchants/id`          :requests a merchant from merchant id 
- `GET /api/v1/merchants/:id/items`   :requests a lits of items associated with merchant id

## Searching for an Item (examples) 

- `GET /api/v1/items/find?name=`      :requests an item associate with name search


Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
