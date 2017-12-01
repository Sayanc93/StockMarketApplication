class PortfolioUpdaterService

  BSE_URL = "http://www.bseindia.com/markets/equity/EQReports/StockPrcHistori.aspx?expandable=7&scripcode="

  def initialize
    @agent = Mechanize.new { |mech_agent|
      mech_agent.open_timeout = 5
      mech_agent.read_timeout = 5
      mech_agent.follow_meta_refresh = true
     }
  end

  def fetch_stock_prices(companies: Company.all)
    companies.each do |company|
      company_page_url = BSE_URL + company.code
      stock_share_page = @agent.get(company_page_url)
      opening_price = stock_share_page.search(".TTRow").search('td.TTRow_right10')[0].try(:text) || "0.0"
      closing_price = stock_share_page.search(".TTRow").search('td.TTRow_right10')[3].try(:text) || "0.0"
      if closing_price || opening_price
        high = closing_price > opening_price
        percent_change = (((closing_price.to_f - opening_price.to_f) / opening_price.to_f) * 100)
        company.update_attributes(current_price: closing_price, high: high, percent_change: percent_change)
      end
    end
  end
end
