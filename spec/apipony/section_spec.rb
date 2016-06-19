describe Apipony::Section do
  let(:section) { Apipony::Section.new('Example') }

  describe '#endpoint' do
    it 'adds new endpoint to section' do
      section.endpoint(:get, '/example')

      expect(section.endpoints).to eq(
        [
          Apipony::Endpoint.new(:get, '/example')
        ]
      )
    end
  end
end
