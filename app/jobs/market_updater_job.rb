class MarketUpdaterJob < ApplicationJob

  def perform
    scraping_service = MarketUpdaterService.new
    scraping_service.fetch_market_indices_data
  end

end
