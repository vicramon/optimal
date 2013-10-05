class HomeController < ApplicationController

  def index
    loser_list = Losers.new.to_s
    @stocks = StockQuote::Stock.quote(loser_list)
    @stocks.reject! do |stock|
      stock.response_code == 404 ||
      stock.last < 20.00 ||
      stock.last > 100.00 ||
      stock.perc_change > -5.00
    end
    @stocks.sort_by! { |stock| stock.perc_change }
  end


end
