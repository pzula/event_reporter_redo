gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/registry'
require './lib/printer'

class PrinterTest < Minitest::Test
  attr_reader :printer

  def setup
    @printer = Printer.new
  end

  def test_it_prints_a_header
    expected_header = "LAST NAME  FIRST NAME  EMAIL  ZIPCODE  CITY  STATE  ADDRESS  PHONE"
    assert_equal expected_header, printer.header
  end 

  def attendee_joe
    Attendee.new( :first_name => "Joe",
                  :last_name => "Schmoe",
                  :email => "joe@example.com",
                  :zipcode => "80209",
                  :city => "Denver",
                  :state => "CO",
                  :street => "123 First Street",
                  :home_phone => "202-555-5555" )
  end

  def attendee_jane
    Attendee.new( :first_name => "Jane",
                  :last_name => "Schmoe",
                  :email => "jane@example.com",
                  :zipcode => "80209",
                  :city => "Denver",
                  :state => "CO",
                  :street => "123 First Street",
                  :home_phone => "202-777-7777" )
  end

  def test_it_prints_an_attendee
    expected = "Schmoe  Joe  joe@example.com  80209  Denver  CO  123 First Street  202-555-5555"
    assert_equal expected, printer.format_attendee(attendee_joe)
  end

  def test_it_can_print_multiple_attendees
    attendees = [
              attendee_joe,
              attendee_jane]
    expected1 = "Schmoe  Joe  joe@example.com  80209  Denver  CO  123 First Street  202-555-5555"
    expected2 = "Schmoe  Jane  jane@example.com  80209  Denver  CO  123 First Street  202-777-7777"
    expected = [expected1, expected2].join("\n")
    assert_equal expected, printer.format_attendees(attendees)
  end

  def test_it_has_a_print_attendees_method
    assert printer.respond_to?(:print_attendees)
  end

end
