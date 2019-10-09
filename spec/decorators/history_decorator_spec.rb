require 'rails_helper'

RSpec.describe HistoryDecorator do
  let(:history) { 
    build_stubbed(:history, created_at: '10.10.2019 22:55').decorate 
  }

  it 'returns sum' do
    expect(history.sum).to eq('1,50 руб.')
  end
  
  it 'returns force_date' do
    expect(history.force_date).to eq('05.10.2019 22:55')
  end

  it 'returns created_at' do
    expect(history.created_at).to eq('10.10.2019 22:55')
  end
  
end
