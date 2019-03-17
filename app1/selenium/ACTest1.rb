require "json"
require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

describe "ACTest1" do

  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "https://www.katalon.com/"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end
  
  after(:each) do
    @driver.quit
    @verification_errors.should == []
  end
  
  it "test_a_c_test1" do
    @driver.get "http://localhost:3000/users/sign_in"
    @driver.find_element(:id, "user_email").click
    @driver.find_element(:id, "user_email").clear
    @driver.find_element(:id, "user_email").send_keys "anna13@gmail.com"
    @driver.find_element(:id, "user_password").click
    @driver.find_element(:id, "user_password").clear
    @driver.find_element(:id, "user_password").send_keys "123456"
    @driver.find_element(:name, "commit").click
    @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Subjects'])[1]/following::div[5]").click
    @driver.find_element(:link, "Back").click
    @driver.find_element(:link, "Create new subject").click
    @driver.find_element(:id, "name").click
    @driver.find_element(:id, "name").clear
    @driver.find_element(:id, "name").send_keys "Элкек"
    @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Kind'])[1]/following::label[2]").click
    @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Back to subjects'])[1]/preceding::input[1]").click
    @driver.find_element(:link, "Back to subjects").click
    @driver.find_element(:link, "Delete subject").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "did")).select_by(:text, "Элкек")
    @driver.find_element(:id, "did").click
    @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Subject'])[1]/following::input[1]").click
    @driver.find_element(:link, "Back to subjects").click
  end
  
  def element_present?(how, what)
    ${receiver}.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end
  
  def alert_present?()
    ${receiver}.switch_to.alert
    true
  rescue Selenium::WebDriver::Error::NoAlertPresentError
    false
  end
  
  def verify(&blk)
    yield
  rescue ExpectationNotMetError => ex
    @verification_errors << ex
  end
  
  def close_alert_and_get_its_text(how, what)
    alert = ${receiver}.switch_to().alert()
    alert_text = alert.text
    if (@accept_next_alert) then
      alert.accept()
    else
      alert.dismiss()
    end
    alert_text
  ensure
    @accept_next_alert = true
  end
end
