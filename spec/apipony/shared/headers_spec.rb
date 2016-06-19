describe Apipony::Shared::Headers do
  before(:each) do
    @dummy = Class.new
    @dummy.extend(Apipony::Shared::Headers)
  end

  describe '#headers' do
    it 'sets and returns @headers value' do
      @dummy.headers { :example }

      expect(@dummy.headers).to eq(:example)
    end
  end
end
