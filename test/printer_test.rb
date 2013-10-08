gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/registry'
require './lib/printer'

class PrinterTest < Minitest::Test

  def test_it_exists
    assert Printer
  end

  def test_it_prints_a_header
    printer = Printer.new
    expected_header = "LAST NAME  FIRST NAME  EMAIL  ZIPCODE  CITY  STATE  ADDRESS  PHONE"
    assert_equal expected_header, printer.header
  end 

  def test_it_prints_an_attendee
    attendee = Attendee.new( :first_name => "Joe",
                            :last_name => "Schmoe",
                            :email => "joe@example.com",
                            :zipcode => "80209",
                            :city => "Denver",
                            :state => "C0",
                            :street => "123 First Street",
                            :home_phone => "202-555-5555" )
    printer = Printer.new
    expected = "Schmoe Joe  joe@example.com  80209 Denver  CO  123 First Street  202-555-5555"
    assert_equal expected, printer.print_attendee(attendee)
  end

end