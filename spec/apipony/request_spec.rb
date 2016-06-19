describe Apipony::Request do
  let(:request) { Apipony::Request.new }

  describe '#param' do
    it 'adds new parameter to @params array' do
      request.param(:name)

      expect(request.params).to eq(
        [
          Apipony::Parameter.new(:name)
        ]
      )
    end
  end

  describe '#params' do
    it 'returns @params sorted by required' do
      request.param(:name)
      request.param(:age, required: true)

      expect(request.params).to eq(
        [
          Apipony::Parameter.new(:age, required: true),
          Apipony::Parameter.new(:name)
        ]
      )
    end
  end
end
