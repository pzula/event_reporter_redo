gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/command_interpreter'

class CommandInterpreterTest < Minitest::Test 

  def test_it_exists
    assert CommandInterpreter
  end

  class FakeCommandRunner
    def load(filename)
      [:load, "some_data.csv"]
    end
  end

  def test_it_accepts_a_load_instruction
    ci = CommandInterpreter.new(FakeCommandRunner)

    command = "load some_data.csv"
    result = ci.run(command)
    
    assert_equal [:load, "some_data.csv"], result

  end


end