class StockMarketUpdaterService

  MONEY_CONTROL_URL = "http://www.moneycontrol.com/".freeze

  def initialize
    @agent = Mechanize.new { |mech_agent|
      mech_agent.open_timeout = 5
      mech_agent.read_timeout = 5
      mech_agent.follow_meta_refresh = true
     }
  end

  def fetch_market_indices_data
    moneycontrol = @agent.get(MONEY_CONTROL_URL)
    data_rows = moneycontrol.search('table.rhsglTbl').search('tr')
    nifty_data = sanitize_data_with_index(data: data_rows[1], index: "Nifty 50")
    bse_smallcap_data = sanitize_data_with_index(data: data_rows[5], index: "BSE SmallCap")
    bse_midcap_data = sanitize_data_with_index(data: data_rows[6], index: "BSE MidCap")
    save_market_data(data: nifty_data, row: data_rows, index: "Nifty 50")
    save_market_data(data: bse_smallcap_data, row: data_rows, index: "BSE SmallCap")
    save_market_data(data: bse_midcap_data, row: data_rows, index: "BSE MidCap")
    broadcast_market_update_status
  end

  def sanitize_data_with_index(data:, index:)
    fetched_data = data.search('td').map{ |n| n.text.strip }
    fetched_data.first == index ? fetched_data.drop(1) : nil
  end

  def save_market_data(data:, row:, index:)
    market_index = Market.find_by(name: index)
    rise_boolean = row.search('td')[2].values.last == "grntxt" ? true : false
    market_index.update_attributes(current_price: data[0],
                                   change: data[1],
                                   percent_change: data[2],
                                   high: rise_boolean)
  end

  def broadcast_market_update_status
    ActionCable.server.broadcast("market_updater", status: "market_updated")
  end
end
