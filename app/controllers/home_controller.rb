class HomeController < ApplicationController

  def index
    loser_list = Losers.new.to_s
    @stocks = StockList.new(loser_list).stocks

    third_friday = ThirdFriday.new(Date.today).find
    @call_dates = @stocks.map do |stock|
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
