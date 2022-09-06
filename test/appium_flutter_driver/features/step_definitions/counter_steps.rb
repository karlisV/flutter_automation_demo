Given(/^the user taps on the increment button (\d+) time(?:|s)$/) do |times|
  times.to_i.times { @screens.counter.tap_on_increment_button }
end

Then(/^the user sees the general text$/) do
  expect(@screens.counter.main_description_text).to eq('You have pushed the button this many times:')
end

And(/^the user should see the increment amount increase by (\d+)$/) do |counter|
  expect(@screens.counter.counter_text).to eq(counter.to_s)
end
