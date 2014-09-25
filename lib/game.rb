class Game

  attr_reader :user_input,
              :printer,
              :code_maker,
              :guesses,
              :win_condition

  def initialize(input_getter_from_CLI, printer_from_CLI, code_maker = nil)
    @printer = printer_from_CLI
    @code_maker = code_maker || CodeMaker.new
    @guesses = []
    @user_input = input_getter_from_CLI
    # The win_condition array evaluates to
    # [correct_positions, correct_colors]
    @win_condition = [4, 0]
  end

  def play
    printer.play
    until win? || quit?
      printer.make_guess
      user_input.get
      case
      when quit?
        printer.quit
      when user_input.input.length != 4
        printer.invalid_input
      when win?
        printer.winner(code_maker.code, guesses.length)
      else
        guesses << user_input.input
        results_array = GuessChecker.compare(code_maker.code, @user_input.input)
        printer.response(user_input.input, results_array, guesses.length)
      end

    end

  end


  private

  def win?
    guesses << 1 if guesses.length == 0
    results_array = GuessChecker.compare(code_maker.code, user_input.input)
    results_array == win_condition
  end

  def quit?
    user_input.input == 'q' || user_input.input == 'quit'
  end

end
