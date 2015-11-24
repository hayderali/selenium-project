#script for tumblr
require 'selenium-webdriver'

browser = Selenium:: WebDriver.for :firefox
browser.get "http://www.tumblr.com/login"

enter_email = browser.find_element id:"signup_email"
enter_email.send_keys "hayder.ali92@gmail.com"
enter_pass = browser.find_element id: "signup_password"
enter_pass.send_keys "banana11"
enter_pass.submit

text_post = browser.find_element id: "new_post_label_text"
text_post.click

message = browser.find_element class: "editor-richtext"
message.send_keys "test message"
post_button = browser.find_element class: "post-form--save-button"
post_button.click

browser.get "http://deepesthologramtyphoon.tumblr.com/"


# if wait.until do
# browser.find_element(tag_name: "p").text.match /test message/
  # puts "Test Passed! Found THE MESSAGE !!!!" 
# else
  # puts "Can't Found"
# end


