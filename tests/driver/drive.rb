require 'selenium-webdriver'
require 'rubygems'

#Selenium::WebDriver::Chrome::Service.driver_path = "C:/chromedriver.exe"

driver = Selenium::WebDriver.for :chrome
#driver.navigate.to "http://localhost:3000/attendances/"

driver.navigate.to "http://localhost:3000/attendances/new"

if driver.find_element(:id , 'attendance_title' ).displayed?
    driver.find_element(:id , 'attendance_title').send_keys 'funcionario22'
    driver.find_element(:id , 'attendance_content').send_keys 'bee' # insere conteudo
    driver.find_element(:name , 'commit').click # clica no botao cadastrar
    puts "funcionario incluido no site"
else
    puts "falha em inserir"
end

sleep 10