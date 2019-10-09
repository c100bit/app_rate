require 'rails_helper'

RSpec.describe "API::V1::Rates", type: :request do
  describe "GET /api/v1/rates" do
    
    let!(:rates) { create_list(:rate, 5) }
    before { get api_v1_rates_path }    

    it "returns 200 ok" do
      expect(response).to have_http_status(200)
    end

    it "returns all rates" do
      expect(JSON.parse(response.body).size).to eq(5)
    end

  end
end
 