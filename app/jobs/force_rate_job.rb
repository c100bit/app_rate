class ForceRateJob < ApplicationJob
  queue_as :default

  def perform(*args)
    rates_json = ActiveModel::Serializer::CollectionSerializer.new(
      Rate.ordered.decorate, 
      serializer: API::V1::RateSerializer).as_json
    ActionCable.server.broadcast("rates", rates_json)
  end
end
 