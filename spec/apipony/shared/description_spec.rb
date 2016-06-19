describe Apipony::Shared::Description do
  before(:each) do
    @dummy = Class.new
    @dummy.extend(Apipony::Shared::Description)
  end

  describe '#description' do
    it 'sets and returns @description value' do
      @dummy.description('Example')

      expect(@dummy.description).to eq('Example')
    end
  end
end
