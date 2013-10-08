gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/command_interpreter'

class CommandInterpreterTest < Minitest::Test 

  def test_it_exists
    assert CommandInterpreter
  end

  def test_it_accepts_a_load_instruction
    # "load some_data.csv"
    ci = CommandInterpreter.new

    # Send "load some_data.csv" into ci
    command = "load some_data.csv"
    result = ci.run(command)
    
    # Make sure it runs the load thing (from CommandRunner?)
    assert_equal [:load, "some_data.csv"], result

  end


end