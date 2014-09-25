class CLI

  attr_reader :user_input, :printer

  def initialize(stdout)
    @user_input = InputGetter.new
    @printer = Printer.new(stdout)
  end

  def start
    printer.welcome_message
    until quit?
      start_screen
      case
      when play?
        game_start
      when cheat_code?
        secret_game_start
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

  def game_start
    game = Game.new(@user_input, @printer)
    game.play
  end

  def start_screen
      printer.start_screen
      printer.enter_command
      @user_input.get
      @user_input.input
  end

  def play?
    @user_input.input == 'p' || @user_input.input == 'play'
  end

  def instructions?
    @user_input.input == 'i' || @user_input.input == 'instructions'
  end

  def quit?
    @user_input.input == 'q' || @user_input.input == 'quit'
  end

  def cheat_code?
    @user_input.input == 'uuddlrlrba'
  end

  def secret_game_start
    printer.enter_cheat_code
    cheat_code = gets.strip
    game = Game.new(@user_input, @printer, CodeMaker.new(cheat_code))
    game.play
  end

end
