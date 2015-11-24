#script for tumblr

require 'YAML'
file = YAML::load_file("./user_credential.yml")

require 'selenium-webdriver'
browser = Selenium:: WebDriver.for :firefox
browser.get "http://www.tumblr.com/login"

file["credential"].each do |credential|
  enter_email = browser.find_element(id:"signup_email") 
  enter_email.send_keys credential["username"]
  enter_pass = browser.find_element(id:"signup_password") 
  enter_pass.send_keys credential["password"]
  enter_pass.submit
end

text_post = browser.find_element id: "new_post_label_text"
text_post.click

message = browser.find_element class: "editor-richtext"
message.send_keys "test message"

post_button = browser.find_element class: "post-form--save-button"
post_button.click

dashboard_check = browser.find_elements(class: "post_body")
dashboard_check.each_with_index do |message, post|

  if message.text.match /test message/
    puts  "Post #{post+1}: The message exists !!!"
  else  
    puts "Post #{post+1}: The message doesn't exist :("
  end
end 

