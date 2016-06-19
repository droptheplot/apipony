describe Apipony::Response do
  let(:response) { Apipony::Response.new }

  describe '#body' do
    it 'sets and returns block to @body variable' do
      response.body { :example }

      expect(response.body).to eq(:example)
    end
  end
end
