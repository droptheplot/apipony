Apipony::Documentation.define do
  config do |c|
    c.title = 'API Documentation'
    c.base_url = '/api/v1'
  end

  section 'Ponies' do
    endpoint 'get', '/ponies' do |e|
      e.description = 'Find ponies'

      request_with do
        param :name, example: :applejack, required: true
      end

      response_with 200 do
        example do 
          set :body, {
            :name => :applejack,
            :kind => :earth,
            :sex => :female,
            :occupation => :farmer
          }
        end
      end
    end

    endpoint 'post', '/ponies' do |e|
      e.description = 'Create pony'

      request_with do
        param :name, example: :fluttershy
        param :kind, example: :pegasus
        param :sex, example: :female
        param :occupation, example: :caretaker
      end

      response_with 200
    end

    endpoint 'put', '/ponies/:id' do |e|
      e.description = 'Update pony id'

      request_with do
        param :name
        param :kind
        param :sex
        param :occupation
      end
    end

    endpoint 'delete', '/ponies/:id' do |e|
      e.description = 'Delete pony by id'

      response_with 200
    end
  end

  section 'Places' do
    endpoint 'get', '/places' do |e|
      e.description = 'Get places'

      response_with 200 do |r|
        r.example do 
        set :body, [
            {
              :id => 1,
              :name => :equestria
            },
            {
              :id => 2,
              :name => :ponyville
            },
            {
              :id => 3,
              :name => :canterlot
            }
          ]
        end
      end
    end
  end
end
