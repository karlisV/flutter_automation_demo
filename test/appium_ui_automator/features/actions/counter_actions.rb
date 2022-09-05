class CounterActions
  def tap_on_increment_button
    increment_button.click
  end

  def wait_for_counter_element(count, timeout = 10)
    wait = Selenium::WebDriver::Wait.new timeout: timeout
    begin
      wait.until { increment_amount_element count }
    rescue Selenium::WebDriver::Error::TimeoutError => e
      raise "Element not found\n Error: #{e.message}"
    end
  end
end
