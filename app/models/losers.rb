class Losers

  require 'open-uri'
  attr_accessor :document

  def initialize
    self.document = get_document
  end

  def symbols
    links.map do |link|
      link.text.strip.match(/\(([a-zA-Z]+)\)/)[0].delete("()")
    end
  end

  def get_document
    Nokogiri::HTML(open(url).read)
  end

  def links
    document.css(".mdcTable a.linkb")
  end

  def to_s
    symbols.join(', ')
  end

  def url
    "http://online.wsj.com/mdc/public/page/2_3021-losecomp-loser.html"
  end

end
