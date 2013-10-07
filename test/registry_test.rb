gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/registry'
require './lib/attendee'

class RegistryTest < Minitest::Test 
  def test_it_exists
    assert Registry
  end

  def test_it_finds_attendees_by_first_name
    reg = Registry.new
    reg.attendees = [
      Attendee.new(:first_name => "SaRah"),
      Attendee.new(:first_name => "sarah"),
      Attendee.new(:first_name => "Billy")
    ]

    attendees = reg.find_all_by_first_name("Sarah")

    assert_equal 2, attendees.count
    attendees.each do |attendee|
      assert_equal "sarah", attendee.first_name.downcase
    end
  end 

  def test_it_finds_attendees_by_last_name
    reg = Registry.new
    reg.attendees = [
      Attendee.new(:last_name => "Johns"),
      Attendee.new(:last_name => "Smith"),
      Attendee.new(:last_name => "JoHNs")
    ]

    attendees = reg.find_all_by_last_name("Sarah")

    assert_equal 2, attendees.count
    attendees.each do |attendee|
      assert_equal "sarah", attendee.last_name.downcase 
    end
  end 


end