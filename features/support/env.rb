require 'capybara'
require 'capybara/cucumber'
require 'site_prism'
require 'selenium-webdriver'

# -----------------------------------------------------
# configurando a execução no jenkins

@browser = ENV['BROWSER']

if @browser.eql?('headless')
    puts 'Executando com headless'

    Capybara.javascript_driver = :selenium
    Capybara.run_server = false
    
    args = ['--no-default-browser-check']

    caps = Selenium::WebDriver::Remote::Capabilities.chrome(
        'chromeOptions' => { 'args' => args }
    )
    
    Capybara.register_driver :selenium do |app|
        Capybara::Selenium::Driver.new(
            app,
            browser: :remote,
            url: 'http://selenium:4444/wd/hub',
            desired_capabilities: caps
        )
    end
else
    puts 'Executando sem headless'
end

# configurando a execução no jenkins
# -----------------------------------------------------

# SitePrism.configure do |config|
#     config.use_implicit_waits = true
#   end

Capybara.configure do |config|
    config.default_driver = :selenium_chrome
    # config.default_driver = :selenium #<== firefox
    
    config.app_host  = 'http://mark7.herokuapp.com'
end    
   
# Até 10 segundos para achar um elemento
Capybara.default_max_wait_time = 10
