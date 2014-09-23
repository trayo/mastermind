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

end
