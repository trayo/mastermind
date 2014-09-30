gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'stringio'
require_relative '../lib/guess_checker'
require_relative '../lib/code_maker'
require_relative '../lib/game'

class GameTest < Minitest::Test

  def test_game_accepts_user_input
    skip
    game = Game.new()
    assert_equal "rrrr", game.user_input
  end

  def test_game_quits
    input = StringIO.new("q\n")
    output = StringIO.new
    game = Game.new(input, output)
    assert_includes output.string.downcase, "no"
  end

  def test_win_method
    skip
    game = Game.new(nil, nil, nil)
    assert_equal true, send(win?)
  end

end
