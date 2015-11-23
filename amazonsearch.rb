#script for amazon

require 'selenium-webdriver'

browser = Selenium:: WebDriver.for :firefox
browser.get "http://www.amazon.co.uk"
a = browser.find_element id:"twotabsearchtextbox"
a.send_keys "Eloquent Ruby"
a.submit
price = browser.find_element css: "span[class='a-size-base a-color-price s-price a-text-bold']"

puts "Price is " + price.text.to_s