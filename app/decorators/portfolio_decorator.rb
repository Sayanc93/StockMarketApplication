class PortfolioDecorator < ApplicationDecorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def company_name
    object.company.name
  end

  def current_value
    (object.number.to_f * current_value_of_stock).round(2)
  end

  def investment
    (object.buying_stock_price.to_f * object.number.to_f).round(2)
  end

  def company_name
    object.company.name
  end

  def total_percent_change
    ( ( (current_value - investment ) / investment) * 100 ).round(2)
  end

  def current_value_of_stock
    object.company.current_price.to_f
  end

  def percent_share_of_total_investment(total_investment = 0)
    percent_share = ( ( ( total_investment - investment ) / total_investment ) * 100 ).round(2)
    "(#{percent_share} %)"
  end

  def is_high_glyphicon?
    h.content_tag :span, '', class: ('glyphicon ' + (total_percent_change > 0 ? 'glyphicon-triangle-top' : 'glyphicon-triangle-bottom'))
  end

end
