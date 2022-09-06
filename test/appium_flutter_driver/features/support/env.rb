# frozen_string_literal: true

require 'appium_lib'
require 'appium_flutter_finder'

caps = {
  caps: {
    platformName: 'Android',
    deviceName: 'emulator-5554',
    app: './../../build/app/outputs/flutter-apk/app-debug.apk',
    automationName: 'Flutter'
  },
  appium_lib: {
    server_url: 'http://0.0.0.0:4723/'
  }
}

@driver = Appium::Driver.new(caps, true).start_driver
Appium.promote_appium_methods Object
