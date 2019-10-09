require 'rails_helper'

RSpec.describe ForceRateJob, type: :job do

    describe '#perform' do
      it 'broadcasts rates' do
        create(:rate, code: 'usd', sum: 15)
        create(:rate, code: 'eur', sum: 15)
        expect { subject.perform }.to have_broadcasted_to("rates").with("USD": 15) 
      end  
  end

end 
