require 'open-uri'

class UpdateRateJob < ApplicationJob
  queue_as :default

  URL = "https://www.cbr-xml-daily.ru/daily_json.js"
  
  def perform(url)
    url ||= URL
    json = JSON.load(open(url))
    for rate in Rate.all
      sum = json['Valute'][rate.code]['Value']
      rate.update(sum: sum) 
    end
  end
end
