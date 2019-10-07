require 'rails_helper'

RSpec.describe Rate, type: :model do

  context "when Factory" do 
    it { expect(build(:rate)).to be_valid }   
  end
  
  context 'when validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:sum) }
    it { should validate_presence_of(:code) }
    it { should validate_uniqueness_of(:code).case_insensitive }
    it { should validate_length_of(:code). is_equal_to(3) }
    it { should validate_numericality_of(:sum).is_greater_than(0) }
     
    context 'when force_sum' do
      before { allow(subject).to receive(:force_sum?).and_return(true) }
      it { should validate_presence_of(:force_date) }  
    end
    
    context 'when force_date' do
      before { allow(subject).to receive(:force_date?).and_return(true) }
      it { should validate_presence_of(:force_sum) }  
      it { should validate_numericality_of(:force_sum).is_greater_than(0) }
    end
  end

  context 'when associations' do
    it { should have_many(:histories) }
  end 

  context 'when creates' do
    let(:rate) { create(:rate) } 
    it { expect(rate.persisted?).to eq(true) }
    it { expect(rate.code).to eq(rate.code.upcase) }
  end

end
