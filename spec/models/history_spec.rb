require 'rails_helper'

RSpec.describe History, type: :model do
  
  context "when Factory" do 
    it { expect(build(:history)).to be_valid }   
  end 

  context 'when validations' do
    it { should validate_presence_of(:force_date) }
    it { should validate_presence_of(:sum) }
    it { should validate_numericality_of(:sum).is_greater_than(0) }
  end

  context 'when associations' do
    it { should belong_to(:rate).required }
  end 

  context 'when creates' do
    let(:history) { create(:history) } 
    it { expect(history.persisted?).to eq(true) }
  end


end
