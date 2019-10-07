require 'rails_helper'

RSpec.describe UpdateRateJob, type: :job do

  describe '#perform' do
    it 'updates sum for all rates' do
      create(:rate, code: 'usd')
      create(:rate, code: 'eur')
      updated_rates = subject.perform(file_fixture("daily_json.js"))
      expect(updated_rates.map(&:sum)).to contain_exactly(71.3509, 65.03) 
    end  
  end
end
