class CounterScreen < CounterActions

  def initialize
    @increment_button = Element.new(:by_type, 'FloatingActionButton')
    @main_description = Element.new(:by_value_key, 'counter-discription-key')
    @increment_amount_element = Element.new(:by_value_key, 'counter-key')
    super()
  end

end

