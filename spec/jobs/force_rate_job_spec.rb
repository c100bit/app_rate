require 'rails_helper'

RSpec.describe ForceRateJob, type: :job do

    describe '#perform' do
      it 'broadcasts rates' do
        create(:rate, code: 'usd', sum: 65)
        create(:rate, code: 'eur', sum: 15)
        expect { 
          subject.perform 
        }.to have_broadcasted_to("rates").with { |data|
          expect(data).to include(
            {"code"=>"USD", "current"=>'65,00 руб.', "id"=>1, "title"=>"usd"},
            {"code"=>"EUR", "current"=>'15,00 руб.', "id"=>2, "title"=>"usd"}
          ) 
        }
      end  
  end

end 
