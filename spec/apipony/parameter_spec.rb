describe Apipony::Parameter do
  let(:parameter) { Apipony::Parameter.new(:name) }

  describe '#type' do
    it 'returns :string by default' do
      expect(parameter.type).to eq(:string)
    end
  end

  describe '#required' do
    it 'returns false by default' do
      expect(parameter.required).to be false
    end
  end

  describe '#required?' do
    it 'should be an alias to #required' do
      expect(parameter.method(:required?).original_name).to eq(
        parameter.method(:required).original_name
      )
    end
  end

  describe '#==' do
    example_options = {
      example: :example,
      description: :description,
      type: :integer,
      required: true
    }

    it 'returns true if objects are equal' do
      one = Apipony::Parameter.new(:name, example_options)
      another = Apipony::Parameter.new(:name, example_options)

      expect(one).to eq(another)
    end

    it 'returns false if objects are not equal' do
      one = Apipony::Parameter.new(:name, example_options)
      another = Apipony::Parameter.new(:age)

      expect(one).not_to eq(another)
    end
  end
end
