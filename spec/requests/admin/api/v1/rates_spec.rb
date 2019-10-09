require 'rails_helper'

RSpec.describe "ADMIN::API::V1::Rates", type: :request do
  let!(:rates) { create_list(:rate_with_histories, 5) } 
  let(:id) { rates.first.id }

  describe "GET /admin/api/v1/rates" do
    before { get admin_api_v1_rates_path }     

    it "returns 200 ok" do
      expect(response).to have_http_status(200)
    end
 
    it "returns all rates" do
      expect(JSON.parse(response.body).size).to eq(5)
    end

    it 'returns rates with histories' do
      rates = JSON.parse(response.body, symbolize_names: true)
      histories = rates.first[:histories]
      expect(histories).not_to be_empty
    end
  end

  describe "PUT /admin/api/v1/rates/:id" do
    let(:params) do
      { force_sum: 1000, force_date: Time.current + 5.days }
    end
 
    before { put admin_api_v1_rate_path(id), params: params }    

    it "returns 200 ok" do
      expect(response).to have_http_status(200) 
    end
 
    it "returns all rates" do 
      expect(JSON.parse(response.body).size).to eq(5)
    end

    it 'returns updated rate' do
      rates = JSON.parse(response.body, symbolize_names: true)
      rate = rates.find { |r| r[:id] == id }
      expect(rate[:current]).to eq("1 000,00 руб.")
    end
    
    it 'broadcasts to rates' do 
      expect { 
        put admin_api_v1_rate_path(id), params: params
      }.to have_broadcasted_to("rates")
    end

    it 'returns rates with histories' do
      rates = JSON.parse(response.body, symbolize_names: true)
      histories = rates.first[:histories]
      expect(histories).not_to be_empty
    end
  end
end
