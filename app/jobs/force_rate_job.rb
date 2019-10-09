class ForceRateJob < ApplicationJob
  queue_as :default

  def perform(*args)
    res = []
    for rate in Rate.all
        res << { "#{rate.code}": rate.current } 
      end
    end
    ActionCable.server.broadcast("rates", res.to_json) if res
  end
end
