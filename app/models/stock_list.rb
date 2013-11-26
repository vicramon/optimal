class StockList

  attr_accessor :stocks

  def initialize(symbols)
    self.stocks = StockQuote::Stock.quote(symbols)
    prune
  end

  def prune
    stocks.reject! do |stock|
      stock.response_code == 404 ||
      stock.last_trade_price_only < 20.00 ||
      stock.last_trade_price_only > 100.00 ||
      stock.percent_change.to_f > -5.00 ||
      fund?(stock)
    end
    stocks.sort_by! { |stock| stock.percent_change.to_f }
  end

  def fund?(stock)
    %w(ETN Direxion VelocityShares ProShares iShares PowerShares).each do |fund_name|
      return true if stock.name.include?(fund_name)
    end
    false
  end

end
