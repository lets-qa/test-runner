require 'watir'

chrome_options = Selenium::WebDriver::Chrome::Options.new
chrome_options.add_argument('--headless')
chrome_options.add_argument('--disable-gpu')
chrome_options.add_argument('--no-sandbox')
chrome_options.add_argument('--disable-dev-shm-usage')
chrome_options.add_argument('--disable-extensions')
chrome_options.add_argument('--window-size=1920,1080')

browser = Watir::Browser.new(:chrome, options: chrome_options)
browser.goto('https://example.com')
    puts browser.title
browser.close
