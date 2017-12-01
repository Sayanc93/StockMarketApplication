class UserPortfolioDecorator < Draper::CollectionDecorator
  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def total_companies
    object.count
  end

  def total_quantity
    object.map {|portfolio| portfolio.number.to_f }.sum
  end

  def current_value
    current_value = 0.0
    object.each do |portfolio|
      stock_quantity = portfolio.number.to_f
      current_price = portfolio.company.current_price.to_f
      current_value += stock_quantity * current_price
    end
    current_value.round(2)
  end

  def total_investment
    cost_of_stocks = buying_stock_prices
    stock_detail_pairs = cost_of_stocks.zip(stock_quantities)
    current_stock_values = stock_detail_pairs.map { |stock_price, quantity| stock_price.to_f * quantity.to_f }
    current_stock_values.sum.round(2)
  end

  def stock_quantities
    object.map(&:number)
  end

  def buying_stock_prices
    object.map(&:buying_stock_price)
  end

  def percent_change
    ( ( (current_value - total_investment) / total_investment ) * 100).round(2)
  end

  def represent_percent_change
    "#{percent_change} %"
  end

  def is_high_glyphicon?
    h.content_tag :span, '', class: ('glyphicon ' + (percent_change > 0 ? 'glyphicon-triangle-top' : 'glyphicon-triangle-bottom'))
  end
end
