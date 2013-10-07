gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/registry'

class RegistryTest < Minitest::Test 
  def test_it_exits
    assert Registry
  end

  def test_it_finds_attendees_by_first_name
    #setup object and data

    # do the thing

    # assert that you got the thing

  end 


end