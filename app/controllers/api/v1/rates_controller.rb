module API::V1
  class RatesController < BaseController

    def index
       render json: Rate.ordered.decorate, 
        each_serializer: API::V1::RateSerializer
    end

  end
end