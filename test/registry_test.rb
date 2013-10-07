gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/registry'
require './lib/attendee'

class RegistryTest < Minitest::Test 
  attr_reader :registry

  def setup
    @registry = Registry.new
  end

  def test_it_finds_attendees_by_first_name_irrespective_of_case
    registry.attendees = [
      Attendee.new(:first_name => "SaRah"),
      Attendee.new(:first_name => "sarah"),
      Attendee.new(:first_name => "Billy")
    ]
    attendees = registry.find_all_by_first_name("Sarah")

    assert_equal 2, attendees.count
    attendees.each do |attendee|
      assert_equal "sarah", attendee.first_name.downcase
    end
  end 

  def test_it_finds_attendees_by_last_name
    registry.attendees = [
      Attendee.new(:last_name => "Johns"),
      Attendee.new(:last_name => "Smith"),
      Attendee.new(:last_name => "JoHNs")
    ]

    attendees = registry.find_all_by_last_name("johns")

    assert_equal 2, attendees.count
    attendees.each do |attendee|
      assert_equal "johns", attendee.last_name.downcase 
    end
  end 


end