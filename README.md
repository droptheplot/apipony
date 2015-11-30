# Apipony

[![Gem Version](https://badge.fury.io/rb/apipony.svg)](https://badge.fury.io/rb/apipony)
[![Build Status](https://travis-ci.org/droptheplot/apipony.svg?branch=travis)](https://travis-ci.org/droptheplot/apipony)
[![Code Climate](https://codeclimate.com/github/droptheplot/apipony/badges/gpa.svg)](https://codeclimate.com/github/droptheplot/apipony)

Ruby DSL to create Rails API documentation from your application.

## Getting started

* Add `gem 'apipony'` to Gemfile
* `bundle install`
* `rails g apipony:install`
* Now you can edit your documentation in `config/initializers/apipony.rb`

## How it works

DSL example:

```ruby
Apipony::Documentation.define do
  config do |c|
    c.title = 'Apipony Documentation'
    c.base_url = '/api/v1'
  end

  section 'Ponies' do
    endpoint 'get', '/ponies' do |e|
      e.description = 'Find ponies'

      request_with do
        param :name, example: 'applejack', required: true
      end

      response_with 200 do
        set :body, {
          :name => :applejack,
          :kind => :earth,
          :sex => :female,
          :occupation => :farmer
        }
      end
    end
  end
end
```

## Features

### Predefined Subtypes
Sometimes, when building an API, it can be useful to store data in a common
format. Apipony lets you define this common format once, then use it multiple
times. Check it out:

```ruby
Apipony::Documentation.define do 
  subtype :pony_stub do
    attribute :name, type: :string
    attribute :id, type: :integer
  end
  section "Ponies" do
    endpoint 'get', '/ponies/:id' do |e|
      e.description = "Find a pony with a given name"
      request_with do
        params :id, example: 10, required: true
      end

      response_with 200 do
        example do
          set :body, {
            :name => :applejack,
            :type => :earth,
            :sex => :female,
            :occupation => :farmer,
            :friends => [
              {name: "Twilight Sparkle", id: 1},
              {name: "Pinkie Pie", id: 2},
              {name: "Rainbow Dash", id: 3},
              {name: "Rarity", id: 4}
              {name: "Fluttershy", id: 5}
            ]
          }
        end
      attribute :name, type: :string
      attribute :kind, type: :enum do
        choice :alicorn
        choice :earth
        choice :unicorn
        choice :pegasus
      end
      attribute :friends, type: :pony_stub, array: true
      attribute :occupation, type: :string
    end
  end
  section "Locations" do
    endpoint 'get', '/locations/:id' do |e|
      e.description = "Information about a location"
      response_with 200 do
        example do
          set :body, {
            :name => "Crystal Empire",
            :population => 107,770
            :rulers => [
              {name: "Shining Armor", id: 50},
              {name: "Princess Cadence", id: 90001}
            ]
          }
        end
        attribute :name, type: :string
        attribute :population, type: :number
        attribute :rulers, type: :pony_stub, array: true
      end
    end
  end
end
```
Now, the `friends` attribute of `GET /ponies/:id` and the `rulers` attribute of
`GET /locations/:id` will reference a common subtype on the generated
documetnation.


Generated documentation example:

![Example](https://raw.githubusercontent.com/droptheplot/apipony/master/preview.png)

By default documentation available here `/apipony`. But you can always change it in `config/routes.rb`.
