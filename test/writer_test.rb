gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/writer'

class WriterTest < Minitest::Test 

  def test_it_takes_a_filename
    writer = Writer.new

    assert_equal "Writing to new-file.csv", writer.write_to("new-file.csv")
  end

  def test_it_created_a_directory
    skip
    writer = Writer.new
    writer.mkdir
    assert_equal 0, File.directory?("queue")
  end

end