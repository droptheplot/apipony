describe Apipony::Request do
  let(:request) { Apipony::Request.new }

  describe '#param' do
    it 'adds new parameter to @params array' do
      request.param(:name)

      expect(request.data.params).to eq(
        [
          Apipony::Parameter.new(:name)
        ]
      )
    end
  end
end
