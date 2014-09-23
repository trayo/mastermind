  # def test_case_sensitivity
  #   skip
  # end

gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/code_maker'

class CodeMakerTest < Minitest::Test

  def test_code_is_four_characters_long
    code_maker = CodeMaker.new
    assert_equal 4, code_maker.code.length
  end

  def test_code_is_only_red_blue_green_or_yellow
    code_maker = CodeMaker.new
    code_maker.code.chars.each do |color|
      assert ['r', 'g', 'y', 'b'].include? color
    end
  end

  def test_uses_specific_code
    code_maker = CodeMaker.new("rrrr")
    assert "rrrr", code_maker.code
  end

  def test_it_makes_random_code
    code_maker1 = CodeMaker.new
    code_maker2 = CodeMaker.new
    refute code_maker1.code == code_maker2.code
  end

  def test_compare_guess_is_incorrect
    code_maker = CodeMaker.new("gggg")
    assert_equal [0, 0], code_maker.compare("rrrr")
  end

  def test_compare_guess_is_correct
    code_maker = CodeMaker.new("rrrr")
    assert_equal [4, 0], code_maker.compare("rrrr")
  end


  def test_find_one_correct_position_and_color
    code_maker = CodeMaker.new("rrrg")
    assert_equal [1, 1], code_maker.compare("bbbg")
  end

  def test_find_two_correct_positions_and_colors
    code_maker = CodeMaker.new("ryrg")
    assert_equal [2, 2], code_maker.compare("bybg")
  end

  def test_find_one_correct_color
    code_maker = CodeMaker.new("grrr")
    assert_equal [0, 1], code_maker.compare("bbbg")
  end

  def test_
    code_maker = CodeMaker.new("grrb")
    assert_equal [2, 3], code_maker.compare("rrgb")
  end


end
