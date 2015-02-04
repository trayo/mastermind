class Game
  attr_reader :user_input,
              :printer,
              :code_maker,
              :guesses,
              :win_condition,
              :results_array

  def initialize(input_getter_from_CLI, printer_from_CLI, code_maker = nil)
    @printer       = printer_from_CLI
    @code_maker    = code_maker || CodeMaker.new
    @guesses       = []
    @user_input    = input_getter_from_CLI
    @results_array = []
    @win_condition = [4, 0]
  end

  def play
    printer.play
    until win? || quit?
      printer.make_guess
      user_input.get
      case
      when quit?              then printer.quit
      when input_too_short?   then printer.input_too_short
      when input_too_long?    then printer.input_too_long
      when not_valid_colors?  then printer.invalid_input
      when win? && guesses.length == 0
        guesses << 1 if guesses.length == 0
        printer.winner(code_maker.code, guesses.length)
      when win?
        guesses << user_input.input
        printer.winner(code_maker.code, guesses.length)
      else
        process_results
        printer.response(user_input.input, results_array, guesses.length)
      end
    end
  end

  private

  def process_results
    guesses << user_input.input
    @results_array = GuessChecker.compare(code_maker.code, @user_input.input)
  end

  def not_valid_colors?
    temp = user_input.input.chars
    @code_maker.colors.each {|char| temp.delete(char)}
    !temp.empty?
  end

  def input_too_short?
    user_input.input.length < 4
  end

  def input_too_long?
    user_input.input.length > 4
  end

  def win?
    @results_array = GuessChecker.compare(code_maker.code, user_input.input)
    results_array == win_condition
  end

  def quit?
    user_input.input == 'q' || user_input.input == 'quit'
  end

end
