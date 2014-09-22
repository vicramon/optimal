class HomeController < ApplicationController

  def index
    @stocks = StockList.new(Losers.new.to_s).stocks
    @call_dates = fetch_call_dates
  end

  private

  def fetch_call_dates
    third_friday = ThirdFriday.new(Date.today).find
    @stocks.map do |stock|
      text = CallDate.new(stock.symbol).get_call_date
      if text.present?
        call_date = text.to_date
        css = (call_date < third_friday ? "red" : "green")
        "<span class='#{css}'>#{call_date.strftime("%b %d")}</span>"
      else
        " - "
      end
    end
  end

end
