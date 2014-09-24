gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/input_getter'

class InputGetterTest < Minitest::Test

  def test_has_empty_string_by_default
    user_input = InputGetter.new
    assert_equal "", user_input.input
  end

  def test_takes_an_input
    user_input = InputGetter.new
    user_input.get
    assert_equal "hello", user_input.input
  end

end
