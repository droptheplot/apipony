# Apipony

[![Gem Version](https://badge.fury.io/rb/apipony.svg)](https://badge.fury.io/rb/apipony)
[![Build Status](https://travis-ci.org/droptheplot/apipony.svg?branch=travis)](https://travis-ci.org/droptheplot/apipony)
[![Code Climate](https://codeclimate.com/github/droptheplot/apipony/badges/gpa.svg)](https://codeclimate.com/github/droptheplot/apipony)

Ruby DSL to create Rails API documentation from your application.

## Getting Started
* Add `gem 'apipony'` to Gemfile
* `bundle install`
* `rails g apipony:install`
* Edit your documentation in `config/initializers/apipony.rb`

![Example](https://raw.githubusercontent.com/droptheplot/apipony/master/preview.png)

## Example

```ruby
Apipony::Documentation.define do
  configure do
    title 'API Documentation'
    base_url 'http://localhost:3000/api/v1'
    console true
  end

  section 'Ponies' do
    endpoint :get, '/ponies' do
      description 'List ponies.'

      request_with do
        headers do
          {
            'Accept' => 'application/json'
          }
        end

        param :name, required: true, description: 'Name of pony.',
                                     example: :fluttershy
      end

      response_with do
        headers do
          [
            [:apipony, true]
          ]
        end

        body do
          [
            {
              name: 'Fluttershy',
              kind: 'Pegasus'
            }
          ]
        end
      end
    end

    endpoint :post, '/ponies' do
      description 'Create new pony.'

      request_with do
        param :name, required: true, example: :fluttershy
        param :kind, example: :pegasus
        param :sex, required: true, example: :female
        param :occupation, example: :caretaker,
                           description: 'What this pony do for living.'
      end
    end

    endpoint :put, '/ponies/:id' do
      description 'Update pony by id.'

      request_with do
        param :name
        param :kind
        param :sex
        param :occupation
      end
    end

    endpoint :delete, '/ponies/:id' do
      description 'Delete pony by id.'
    end
  end

  section 'Places' do
    endpoint :get, '/places' do
      description 'List places.'

      response_with do
        status 200

        body do
          [
            {
              name: 'Equestria'
            },
            {
              name: 'Ponyville'
            }
          ]
        end
      end
    end

    endpoint :get, '/places/:id' do
      response_with do
        status 200

        body do
          {
            name: 'Crystal Empire',
            population: 107706
          }
        end
      end
    end
  end
end
```

By default documentation available here `/apipony`. But you can always change it in `config/routes.rb`.

## Contributing

1. Fork it (https://github.com/droptheplot/apipony/fork)
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
