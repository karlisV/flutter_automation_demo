class Screens
  attr_reader :counter

  def initialize(driver)
    @counter = CounterScreen.new(driver)
  end
end
