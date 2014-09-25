gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/guess_checker'
require_relative '../lib/code_maker'
require_relative '../lib/game'

class GameTest < Minitest::Test

  public :win?

  def test_game_accepts_user_input
    skip
    game = Game.new()
    assert_equal "rrrr", game.user_input
  end

  def test_win_method
    game = Game.new(nil, nil, nil)
    assert_equal true, send(win?)
  end

end
