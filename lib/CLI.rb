# *import colorize*

class CLI

  attr_reader :user_input, :printer

  def initialize
    @user_input = ""
    @printer = Printer.new
  end

  def start

    printer.startup
    until quit?
      printer.enter_command
      @user_input = gets.strip
      case
      when play?
        printer.play
      when instructions?
        printer.instructions
      when quit?
        printer.quit
      else
        printer.invalid_input
      end

    end

  end

  private

  def play?
    user_input == 'p' || user_input == 'play'
  end

  def instructions?
    user_input == 'i' || user_input == 'instructions'
  end

  def quit?
    user_input == 'q' || user_input == 'quit'
  end

end
