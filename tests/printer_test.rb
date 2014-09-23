gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/printer'

class PrinterTest < Minitest::Test

  def test_startup_message
    assert_output "Welcome to MASTERMIND",{ Printer.startup}
  end

  def test_start_screen_message
    assert_equal "Would you like to (p)lay, read the (i)nstructions, or (q)uit?", Printer.start_screen
  end

end
