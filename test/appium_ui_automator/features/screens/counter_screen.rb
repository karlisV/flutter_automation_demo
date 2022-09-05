class CounterScreen < CounterActions
  def initialize(driver)
    @driver = driver
    super()
  end

  def increment_button
    @driver.find_element(accessibility_id: 'Increment')
  end

  def main_text
    @driver.find_element(accessibility_id: 'demo_content_desc_1')
  end

  def increment_amount_element(count)
    @driver.find_element(accessibility_id: "counter-#{count}")
  end
end
