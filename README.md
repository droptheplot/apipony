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
format. A good example would be a list of something.


Generated documentation example:

![Example](https://raw.githubusercontent.com/droptheplot/apipony/master/preview.png)

By default documentation available here `/apipony`. But you can always change it in `config/routes.rb`.
