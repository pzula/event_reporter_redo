gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/command_runner'

class CommandRunnerTest < Minitest::Test 

  def test_it_loads_a_CSV_into_the_registry
    cr = CommandRunner.new
    cr.load("./test/fixtures/partial_attendees.csv")
    assert_equal 9, cr.attendee_count
  end

  def test_it_counts_the_queue_when_empty
    cr = CommandRunner.new
    assert_equal 0, cr.queue_count
  end

  def test_it_counts_a_loaded_queue
    cr = CommandRunner.new
    cr.load("./test/fixtures/partial_attendees.csv")
    cr.find_attendees_by_first_name("Sarah")
    assert_equal 2, cr.queue_count
  end

  def test_it_replaces_queued_items_on_a_second_find
    cr = CommandRunner.new
    cr.load("./test/fixtures/partial_attendees.csv")
    cr.find_attendees_by_first_name("Sarah")
    cr.find_attendees_by_first_name("Audrey")
    assert_equal 1, cr.queue_count
  end



end