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
      Attendee.new(:first_name => "Sarah"),
      Attendee.new(:first_name => "Sarah"),
      Attendee.new(:first_name => "Billy")
    ]
    attendees = reg.find_all_by_first_name("Sarah")

    assert_equal 2, attendees.count
    attendees.each do |attendee|
      assert_equal "Sarah", attendee.first_name 
    end

  end 


end