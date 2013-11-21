
require 'selenium-webdriver'

selenium_host = ENV['SELENIUM_HOST']
selenium_port = ENV['SELENIUM_PORT']
selenium_platform = ENV['SELENIUM_PLATFORM']
selenium_browser = ENV['SELENIUM_BROWSER']
selenium_browser_version = ENV['SELENIUM_VERSION']
selenium_browser_url = ENV['SELENIUM_BROWSER_URL']

bs_username = ENV['BS_USERNAME']
bs_key = ENV['BS_AUTHKEY']
bs_project = ENV['BS_AUTOMATE_PROJECT']
bs_build = ENV['BS_AUTOMATE_BUILD']

url = "http://" + selenium_host + ":" + selenium_port + "/wd/hub"

capabilities = Selenium::WebDriver::Remote::Capabilities.new
capabilities['platform'] = selenium_platform
capabilities['browserName'] = selenium_browser
capabilities['version'] = selenium_browser_version
capabilities['browserstack.user'] = bs_username
capabilities['browserstack.key'] = bs_key
capabilities['project'] = bs_project
capabilities['build'] = bs_build

driver = Selenium::WebDriver.for(:remote, :url => url, :desired_capabilities => capabilities)

driver.get(selenium_browser_url);

puts driver.title

driver.quit
