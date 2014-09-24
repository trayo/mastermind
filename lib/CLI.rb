class CLI

  attr_reader :user_input, :printer

  def initialize
    @user_input = InputGetter.new
    @printer = Printer.new
  end

  def start
    until quit?
      printer.welcome_message
      printer.enter_command
      @user_input.get
      @user_input.input
      case
      when play?
        game = Game.new(@user_input)
        game.play
      when cheat_code?
        printer.enter_cheat_code
        cheat_code = gets.strip
        game = Game.new(@user_input, CodeMaker.new(cheat_code))
        game.play
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
    @user_input.input == 'p' || @user_input.input == 'play'
  end

  def cheat_code?
    @user_input.input == 'uuddlrlrba'
  end

  def instructions?
    @user_input.input == 'i' || @user_input.input == 'instructions'
  end

  def quit?
    @user_input.input == 'q' || @user_input.input == 'quit'
  end

end
