class Printer

  def initialize(stdout)
    @stdout = stdout
  end

  def welcome_message
    @stdout.puts "\nWelcome to MASTERMIND"
    start_screen
  end

  def start_screen
    @stdout.puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def enter_command
    @stdout.print "\nEnter a command (Ex:'p' for play): "
  end

  def instructions
    @stdout.puts "Here lies Instructions, may he rest in peace."
  end

  def make_guess
    @stdout.print "\nMake a guess (Ex:'rrrr'): "
  end

  def invalid_input
    @stdout.puts "Invalid input. Please try again."
  end

  def quit
    @stdout.puts "No! Don't go!"
  end

  def play
    @stdout.puts "I have generated a beginner sequence with four elements made up of: " +
                 "(r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
  end

  def response(input, results, guesses)
    @stdout.puts "'#{input}' has #{results[1]} of the correct colors with #{results[0]} in the correct positions."
    @stdout.puts "You've taken #{guesses} guesses."
  end

  def winner
    @stdout.puts "You win! You guessed the correct code '#{code}' in #{guesses} guesses."
  end

  def enter_cheat_code
    @stdout.print "Enter cheat code: "
  end

end
