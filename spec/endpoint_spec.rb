describe Apipony::Endpoint do
  before(:each) do
    Apipony::Documentation.define do
      configure do
        title 'API Documentation'
        base_url '/api/v1'
      end
    end
  end

  let(:endpoint) { Apipony::Endpoint.new(:get, '/example') }

  describe '#initialize' do
    it 'concatenates given url with base_url' do
      expect(endpoint.url).to eq('/api/v1/example')
    end
  end

  describe '#id' do
    it 'returns valid id' do
      expect(endpoint.id).to eq('get/api/v1/example')
    end
  end

  describe '#data' do
    it 'returns valid data object' do
      endpoint.description 'Example'

      expect(endpoint.data).to eq(
        OpenStruct.new(description: 'Example')
      )
    end
  end

  describe '#response_with' do
    it 'adds response instance to endpoint' do
      endpoint.response_with {}

      expect(endpoint.response).to be_a(Apipony::Response)
    end
  end

  describe '#request_with' do
    it 'adds request instance to endpoint' do
      endpoint.request_with {}

      expect(endpoint.request).to be_a(Apipony::Request)
    end
  end
end
