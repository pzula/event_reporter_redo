gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/command_interpreter'

class CommandInterpreterTest < Minitest::Test 
  attr_reader :ci

  def setup
    @ci = CommandInterpreter.new(FakeCommandRunner)
  end

  class FakeCommandRunner
    def load(filename)
      "running load with #{filename}"
    end
  end

  def test_it_accepts_a_load_instruction
    command = "load some_data.csv"
    result = ci.run(command)
    
    assert_equal "running load with some_data.csv", result
  end

  def test_it_runs_load_without_a_filename
    result = ci.run("load")
    assert_equal "running load with event_attendees.csv", result
  end


end