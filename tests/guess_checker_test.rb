gem 'minitest'
require 'minitest/autorun'

require 'minitest/pride'
require_relative '../lib/guess_checker'
require_relative '../lib/code_maker'


class GuessCheckerTest < Minitest::Test

  def test_compare_guess_is_incorrect
    code_maker = CodeMaker.new("gggg")
    assert_equal [0, 0], GuessChecker.compare(code_maker.code, "rrrr")
  end

  def test_compare_guess_is_correct
    code_maker = CodeMaker.new("rrrr")
    assert_equal [4, 0], GuessChecker.compare(code_maker.code, "rrrr")
  end

  def test_compare_guess_is_correct
    code_maker = CodeMaker.new("rbyg")
    assert_equal [0, 4], GuessChecker.compare(code_maker.code, "gybr")
  end

  def test_find_one_correct_position_and_one_color
    code_maker = CodeMaker.new("rrrg")
    assert_equal [1, 1], GuessChecker.compare(code_maker.code, "bbbg")
  end

  def test_find_two_correct_positions_and_one_color
    code_maker = CodeMaker.new("rgrg")
    assert_equal [2, 1], GuessChecker.compare(code_maker.code, "bgbg")
  end

  def test_find_three_correct_positions_and_one_color
    code_maker = CodeMaker.new("rggg")
    assert_equal [3, 1], GuessChecker.compare(code_maker.code, "bggg")
  end

  def test_find_one_correct_color
    code_maker = CodeMaker.new("grrr")
    assert_equal [1, 1], GuessChecker.compare(code_maker.code, "gbbb")
  end

  def test_find_two_correct_colors
    code_maker = CodeMaker.new("rbgb")
    assert_equal [1, 2], GuessChecker.compare(code_maker.code, "rgyy")
  end

  def test_find_three_correct_colors
    code_maker = CodeMaker.new("rygb")
    assert_equal [1, 3], GuessChecker.compare(code_maker.code, "bryb")
  end

end
