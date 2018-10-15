require 'capybara'
require 'capybara/cucumber'
require 'site_prism'

# @browser = ENV['BROWSER']

# if @browser.eql?('headless')
#     puts 'Executando com headless'

#     Capybara.javascript_driver = :selenium
#     Capybara.run_server = false

#     Capybara.register_driver : selenium do |app|
#     Capybara::Selenium:Driver.new

#     # parei aqui : 2:44

# else
#     puts 'Executando sem headless'
# end

SitePrism.configure do |config|
    config.use_implicit_waits = true
  end

Capybara.configure do |config|
    config.default_driver = :selenium_chrome_headless
    # config.default_driver = :selenium #<== firefox
    
    config.app_host  = 'http://mark7.herokuapp.com'
end    
   
# Até 10 segundos para achar um elemento
Capybara.default_max_wait_time = 10
