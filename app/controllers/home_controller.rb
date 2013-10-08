class HomeController < ApplicationController

  def index
    # improvements: could show:
    # 1 year, 6mo, 3mo low
    # call date
    loser_list = Losers.new.to_s
    @stocks = StockQuote::Stock.quote(loser_list)
    @stocks.reject! do |stock|
      stock.response_code == 404 ||
      stock.last < 20.00 ||
      stock.last > 100.00 ||
      stock.perc_change > -5.00 ||
      fund?(stock)
    end
    @stocks.sort_by! { |stock| stock.perc_change }

    @call_dates = @stocks.map do |stock|
      begin
        CallDate.new(stock.symbol).get_call_date.to_date.strftime("%b %d")
      rescue
        " - "
      end
    end

  end

  def fund?(stock)
    %w(ETN Direxion VelocityShares ProShares iShares PowerShares).each do |fund_name|
      return true if stock.company.include?(fund_name)
    end
    return false
  end

end
