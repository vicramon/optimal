class ThirdFriday

  attr_accessor :month

  def initialize(month)
    self.month = month
  end

  def find
    current_day = first_day
    current_day = current_day.tomorrow until current_day.wday == 5
    current_day + 14
  end

  def first_day
    month.beginning_of_month
  end

end
