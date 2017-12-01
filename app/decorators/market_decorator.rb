class MarketDecorator < ApplicationDecorator

  # delegate :current_page, :total_pages, :limit_value, :entry_name, :total_count, :offset_value, :last_page?
  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def name
    object.name
  end

  def current_value
    object.current_price
  end

  def is_high?
    object.high
  end

  def percent_change
    "#{object.percent_change} %"
  end

  def is_high_glyphicon?
    h.content_tag :span, '', class: ('glyphicon ' + (object.high ? 'glyphicon-triangle-top' : 'glyphicon-triangle-bottom'))
  end
end
