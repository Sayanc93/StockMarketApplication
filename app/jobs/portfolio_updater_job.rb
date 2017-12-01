class PortfolioUpdaterJob < ApplicationJob

  def perform(user_id = nil)
    user = User.find(user_id)
    scraping_service = PortfolioUpdaterService.new
    scraping_service.fetch_stock_prices(companies: user.portfolios.map(&:company))
  end

end
