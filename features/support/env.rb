require 'capybara'
require 'capybara/cucumber'
require 'site_prism'
require 'selenium-webdriver'

# -----------------------------------------------------
# configurando a execução no jenkins

@browser = ENV['BROWSER']

if @browser.eql?('headless')
    puts 'Executando com headless'

    # Capybara.javascript_driver = :selenium
    # Capybara.run_server = false
    
    # args = ['--no-default-browser-check']
    # args = ['--disable-gpu']
    # args = ['--no-sandbox']

# -----------------------------------------------------
    Capybara.register_driver :selenium_chrome_headless_docker_friendly do |app|
        Capybara::Selenium::Driver.load_selenium
        browser_options = ::Selenium::WebDriver::Chrome::Options.new
        browser_options.args << '--headless'
        browser_options.args << '--disable-gpu'
        # Sandbox cannot be used inside unprivileged Docker container
        browser_options.args << '--no-sandbox'
        Capybara::Selenium::Driver.new(app, browser: :chrome, url: 'http://selenium:4444/wd/hub',
        options: browser_options)
      end
      
 Capybara.javascript_driver = :selenium_chrome_headless_docker_friendly
# -----------------------------------------------------



# -----------------------------------------------------
    # caps = Selenium::WebDriver::Remote::Capabilities.chrome(
    #     'chromeOptions' => { 'args' => args }
    # )
    
    # Capybara.register_driver :selenium do |app|
    #     Capybara::Selenium::Driver.new(
    #         app,
    #         browser: :remote,
    #         url: 'http://selenium:4444/wd/hub',
    #         desired_capabilities: caps
    #     )
    # end
else
    puts 'Executando sem headless oi??????'
end

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
Capybara.default_max_wait_time = 5
