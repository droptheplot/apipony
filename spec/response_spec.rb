describe Apipony::Response do
  let(:response) { Apipony::Response.new }

  describe '#body' do
    it 'adds block result to @body variable' do
      response.body { :example }

      expect(response.data.body).to eq(:example)
    end
  end
end
