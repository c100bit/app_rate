module ADMIN::API::V1
  class RatesController < BaseController
    before_action :set_rate, only: [:update]

    def index
      render json: Rate.ordered.includes(:histories).decorate, 
        each_serializer: ADMIN::API::V1::RateSerializer
    end

    def update
      if @rate.update(rate_params)

        @rate.histories.create(
          sum: @rate.force_sum, 
          force_date: @rate.force_date
        )

        rates = Rate.ordered.includes(:histories).decorate

        rates_json = ActiveModel::Serializer::CollectionSerializer.new(
          rates, 
          serializer: API::V1::RateSerializer
        ).as_json

        ActionCable.server.broadcast("rates", rates_json)
        
        render json: rates, 
          each_serializer: ADMIN::API::V1::RateSerializer
          
      else
        render json: @rate.errors, status: :unprocessable_entity
      end
    end

  private

    def set_rate
      @rate = Rate.find(params[:id])
    end

    def rate_params
      params.permit(:force_sum, :force_date)
    end

  end
end