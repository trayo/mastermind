gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'stringio'
require_relative '../lib/printer'

class PrinterTest < Minitest::Test

  attr_reader :printer, :mock_stdout

  def setup
    @mock_stdout = StringIO.new
    @printer = Printer.new(mock_stdout)
  end

  def test_welcome_message
    printer.welcome_message
    mock_stdout.string.include?('Welcome to MASTERMIND')
  end

  def test_start_screen_message
    printer.welcome_message
    mock_stdout.string.include?('Would you like to (p)lay, read the (i)nstructions, or (q)uit?')
  end

  def test_enter_command
    printer.welcome_message
    mock_stdout.string.include?("Enter a command (Ex:'p' for play): ")
  end

  def test_instructions
    printer.welcome_message
    mock_stdout.string.include?('Here lies Instructions, may he rest in peace.')
  end

  def test_make_guess
    printer.welcome_message
    mock_stdout.string.include?("Make a guess (Ex:'rrrr'): ")
  end

  def test_invalid_input
    printer.welcome_message
    mock_stdout.string.include?("Invalid input. Please try again.")
  end

  def test_quit
    printer.welcome_message
    mock_stdout.string.include?("No! Don't go!")
  end

  def test_response
    printer.welcome_message
    mock_stdout.string.include?('Welcome to MASTERMIND')
  end

  def test_winner
    printer.welcome_message
    mock_stdout.string.include?("You win! You guessed the correct code")
  end

  def test_enter_cheat_code
    printer.welcome_message
    mock_stdout.string.include?('Enter cheat code: ')
  end

end
