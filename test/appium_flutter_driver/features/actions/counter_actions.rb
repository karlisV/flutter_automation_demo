class CounterActions

  def main_description_text
    @main_description.text
  end

  def counter_text
    @increment_amount_element.text
  end

  def tap_on_increment_button
    @increment_button.click
  end

end
