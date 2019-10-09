require 'rails_helper'

RSpec.describe ForceRateJob, type: :job do

    describe '#perform' do
      it 'broadcasts rates' do
        create(:rate, code: 'usd', sum: 15)
        create(:rate, code: 'eur', sum: 15)
        expect { 
          subject.perform 
        }.to have_broadcasted_to("rates").with { |data|
          expect(data).to include(
            {"code"=>"USD", "current"=>15.0, "id"=>1, "title"=>"usd"},
            {"code"=>"EUR", "current"=>15.0, "id"=>2, "title"=>"usd"}
          ) 
        }
      end  
  end

end 
