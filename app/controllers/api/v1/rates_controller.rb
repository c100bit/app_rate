module API::V1
  class RatesController < BaseController

    def index
      render json: Rate.ordered
    end

  end
end