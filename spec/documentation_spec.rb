require 'spec_helper'

describe Apipony::Documentation do
  before do
    Apipony::Documentation.define do
      config do |c|
        c.title = 'Apipony Documentation'
        c.base_url = '/api/v1'
      end

      section 'Ponies' do
        endpoint 'get', '/ponies' do |e|
          e.description = 'Find ponies'

          request_with do
            set :params, {
              :name => :applejack
            }
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
  end

  it 'should have valid title' do
    expect(Apipony::Documentation.title).to eq('Apipony Documentation')
  end

  it 'should have valid base_url' do
    expect(Apipony::Documentation.base_url).to eq('/api/v1')
  end

  it 'sections should not be empty' do
    expect(Apipony::Documentation.sections).not_to be_empty
  end

  it 'section should be instance of Apipony::Section' do
    expect(Apipony::Documentation.sections.first).to be_a Apipony::Section
  end

  it 'endpoints should not be empty' do
    expect(Apipony::Documentation.sections.first.endpoints).not_to be_empty
  end

  it 'endpoint should be instance of Apipony::Endpoint' do
    expect(Apipony::Documentation.sections.first.endpoints.first).to be_a Apipony::Endpoint
  end

  it 'endpoint should have valid id' do
    expect(Apipony::Documentation.sections.first.endpoints.first.id).to eq('get/api/v1/ponies')
  end

  it 'response should be instance of Apipony::Response' do
    expect(Apipony::Documentation.sections.first.endpoints.first.response).to be_a Apipony::Response
  end

  it 'request should be instance of Apipony::Request' do
    expect(Apipony::Documentation.sections.first.endpoints.first.request).to be_a Apipony::Request
  end
end
