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

  def test_it_finds_attendees_by_last_name_irrespective_of_case
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

  def test_it_finds_attendees_by_email_irrespective_of_case
    registry.attendees = [
      Attendee.new(:email => "jane@email.com"),
      Attendee.new(:email => "jAnE@email.com"),
      Attendee.new(:email => "joe@gmail.com")
    ]

    attendees = registry.find_all_by_email("JaNe@email.com")

    assert_equal 2, attendees.count
    attendees.each do |attendee|
      assert_equal "jane@email.com", attendee.email.downcase
    end
  end

  def test_it_finds_attendees_by_phone_irrespective_of_format
    registry.attendees = [
      Attendee.new(:home_phone => "333-222-2323"),
      Attendee.new(:home_phone => "3332222323"),
      Attendee.new(:home_phone => "333.222.2323"),
      Attendee.new(:home_phone => "(333)222-2323"),
      Attendee.new(:home_phone => "(333) 222.2323"),
      Attendee.new(:home_phone => "720-333-3424")
    ]

    attendees = registry.find_all_by_phone("(333) 222.2323")

    assert_equal 5, attendees.count
    attendees.each do |attendee|
      assert_equal "3332222323", attendee.home_phone.gsub(/\D/, "")
    end
  end

  def test_it_finds_attendees_by_street_address_irrespective_of_case
    registry.attendees = [
      Attendee.new(:street => "123 MaIn St."),
      Attendee.new(:street => "123 main st."),
      Attendee.new(:street => "530 Pebble Beach Rd.")
    ]

    attendees = registry.find_all_by_street("123 MAin St.")

    assert_equal 2, attendees.count
    attendees.each do |attendee|
      assert_equal "123 main st.", attendee.street.downcase
    end
  end

  def test_it_finds_attendees_by_city_irrespective_of_case
    registry.attendees = [
      Attendee.new(:city => "Denver"),
      Attendee.new(:city => "denver"),
      Attendee.new(:city => "DenVeR"),
      Attendee.new(:city => "Cleveland"),
    ]

    attendees = registry.find_all_by_city("deNver")

    assert_equal 3, attendees.count
    attendees.each do |attendee|
      assert_equal "denver", attendee.city.downcase
    end
  end

  def test_it_finds_attendees_by_state_irrespective_of_case
    registry.attendees = [
      Attendee.new(:state => "co"),
      Attendee.new(:state => "CO"),
      Attendee.new(:state => "cO"),
      Attendee.new(:state => "Oh"),
    ]

    attendees = registry.find_all_by_state("Co")

    assert_equal 3, attendees.count
    attendees.each do |attendee|
      assert_equal "co", attendee.state.downcase
    end
  end

  def test_it_finds_attendees_by_zipcode
    registry.attendees = [
      Attendee.new(:zipcode => "44313"),
      Attendee.new(:zipcode => "44313"),
      Attendee.new(:zipcode => "88304")
    ]

    attendees = registry.find_all_by_zipcode("44313")

    assert_equal 2, attendees.count
    attendees.each do |attendee|
      assert_equal "44313", attendee.zipcode
    end
  end


end