class CallDate
  require 'open-uri'

  attr_accessor :document, :symbol

  def initialize(symbol)
    self.symbol = symbol
    self.document = get_document
  end

  def get_document
    Nokogiri::HTML(open(url).read)
  end

  def get_call_date
    document.xpath("//table[@id='table1']/tr[7]/td").text
  end

  def url; "http://finance.yahoo.com/q?s=#{symbol}"; end

end
