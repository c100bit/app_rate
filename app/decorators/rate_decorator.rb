class RateDecorator < ApplicationDecorator
  delegate_all
  decorates_association :histories

  def current
    h.number_to_currency(object.current, locale: :ru)
  end
  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #e
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
