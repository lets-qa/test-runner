require 'watir'

browser = Watir::Browser.new(:chrome, headless: true)
browser.goto('https://example.com')
puts browser.title
browser.close
