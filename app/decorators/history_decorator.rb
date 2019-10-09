class HistoryDecorator < Draper::Decorator
  delegate_all
  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  # #
  def created_at
    I18n.l object.created_at
  end

  def force_date
    I18n.l object.force_date
  end

  def sum
    h.number_to_currency(object.sum, locale: :ru)
  end

end
