require 'rails_helper'

RSpec.describe RateDecorator do
  let(:rate) { build_stubbed(:rate).decorate }

  it 'returns current value' do
    expect(rate.current).to eq('1,50 руб.')
  end
end
 