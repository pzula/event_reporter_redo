gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/attendee_parser'

class AttendeeParserTest < Minitest::Test 

  def test_it_exists
    assert AttendeeParser
  end

  def test_it_parses_a_data_file
    ap = AttendeeParser.new
    attendees_parsed = ap.parse_file('./test/fixtures/partial_attendees.csv')
    assert_equal 9, attendees_parsed
  end

  def test_the_attendee_data_is_accessible
    ap = AttendeeParser.new
    attendees_parsed = ap.parse_file('./test/fixtures/partial_attendees.csv')
    attendee = ap.attendees.first
    assert_equal "Sam", attendee.first_name
    assert_equal "Johnson", attendee.last_name
    assert_equal "sam@gmail.com", attendee.email
    assert_equal "720-888-888", attendee.home_phone
    assert_equal "123 First Street", attendee.street
    assert_equal "Denver", attendee.city
    assert_equal "CO", attendee.state
    assert_equal "80204", attendee.zipcode 
  end

end