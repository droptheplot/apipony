Apipony::Documentation.define do
  configure do
    title 'API Documentation'
    base_url '/api/v1'
  end

  section 'Ponies' do
    endpoint :get, '/ponies' do
      description 'List ponies.'

      request_with do
        headers do
          {
            'Accept': 'application/json'
          }
        end

        param :name, required: true, description: 'Name of pony.',
                                     example: :fluttershy
      end

      response_with do
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
