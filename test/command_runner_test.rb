gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/command_runner'

class CommandRunnerTest < Minitest::Test 

  def test_it_loads_a_CSV_into_the_registry
    cr = CommandRunner.new
    cr.load("./test/fixtures/partial_attendees.csv")
    assert_equal 10, cr.attendee_count
  end


end