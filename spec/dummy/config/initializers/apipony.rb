Apipony::Documentation.define do
  config do |c|
    c.title = 'API Documentation'
    c.base_url = '/api/v1'
  end

  subtype :pony_stub do
    attribute :name, type: :string
    attribute :id, type: :number
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
        attribute :sex, description: "What sex is this pony?"
        attribute :name, description: "This pony's given name."
        attribute :occupation, description: %{
          A short string describing what occupation this pony has.
        }
        attribute :kind do
          choice :unicorn, description: "A pony with a horn."
          choice :earth, description: "A pony with no horn or wings."
          choice :pegasus, description: "A pony with wings."
          choice :alicorn, description: %{
            A pony with wings and a horn. This also indicates that the pony
            is royalty of some sort.
          }      
        end
        attribute :friends, array: true, type: :pony_stub
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
      e.description = 'Update pony by id'

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

    endpoint 'get', '/places/:id' do |e|
      e.description = "Info about a place"
      response_with 200 do |r|
        r.example do
          set :body, {
            name: "Crystal Empire",
            population: 107706,
            rulers: [
              {
                :id => 10,
                :name => "Shining Armor"
              },
              {
                :id => 100,
                :name => "Princess Cadence"
              }
            ]
          }
        end
        attribute :name, type: :string
        attribute :rulers, array: true, type: :pony_stub
        attribute :population, type: :number
      end
    end
  end
end
