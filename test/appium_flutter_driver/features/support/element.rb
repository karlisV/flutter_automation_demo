# frozen_string_literal: true

class Element
  include Appium::Flutter::Finder

  def initialize(selector_type, value)
    @selector = Hash[type: selector_type.to_sym, value: value]
    @wait_time = 15_000
  end

  def displayed?(wait: 10_000)
    @driver.driver.execute_script('flutter:waitFor', finder, wait)
    true
  rescue Selenium::WebDriver::Error::UnknownError
    false
  end

  def finder
    if @selector[:type] == :by_descendant || @selector[:type] == :by_ancestor
      serialized_finder = method(@selector[:value][:serialized_finder].keys.first).call(@selector[:value][:serialized_finder].values.first)
      matching_finder = method(@selector[:value][:matching].keys.first).call(@selector[:value][:matching].values.first)
      root_bool = @selector[:value].key?(:root) ? @selector[:value][:root] : false
      method(@selector[:type]).call({ serialized_finder: serialized_finder, matching: matching_finder, match_root: root_bool })
    else
      method(@selector[:type]).call(@selector[:value])
    end
  end

  private

  def method_missing(symbol, *args)
    opts = args.detect { |arg| arg.instance_of?(Hash) }
    if opts&.key?(:wait)
      wait = opts[:wait]
      opts.delete(:wait)
    else
      wait = @wait_time
    end
    args -= [nil, {}, []]
    element(wait).public_send(symbol, *args)
  end

  def respond_to_missing?(symbol)
    %i[send_keys click text].include?(symbol) || super
  end

  def element(wait)
    unless displayed?(wait: wait)
      raise Selenium::WebDriver::Error::NoSuchElementError,
            "Element not found with selector:\nType: :#{@selector[:type]}\nValue: '#{@selector[:value]}'\n"
    end

    # Avoid using ::Appium::Flutter::Element directly- incorrect selectors causes Appium to hang up
    ::Appium::Flutter::Element.new(@driver.driver, finder: finder)
  end
end
