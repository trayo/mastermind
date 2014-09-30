gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'stringio'

require_relative '../lib/CLI'
require_relative '../lib/input_getter'
require_relative '../lib/printer'

class TestCLI < Minitest::Test

  def test_game_quits
    input = StringIO.new("q\n")
    output = StringIO.new
    CLI.new(output, input).start
    assert_includes output.string.downcase, "no"
  end

end
