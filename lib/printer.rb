class Printer

  attr_reader :stdout

  def initialize(stdout)
    @stdout = stdout
  end

  def welcome_message
    stdout.puts clear_screen
    stdout.puts "\n\nWelcome to MASTERMIND"
  end

  def start_screen
    stdout.puts "\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def enter_command
    stdout.print "\nEnter a command: "
  end

  def instructions
    stdout.puts "The game will generate a sequence with four elements made up of: " +
                 "(r)ed, (g)reen, (b)lue, and (y)ellow. It will look like 'rybg'."
  end

  def make_guess
    stdout.print "\nMake a guess: "
  end

  def invalid_input
    stdout.puts "Invalid input. Please try again."
  end

  def input_too_long
    stdout.puts "Input too long. Try again."
  end

  def input_too_short
    stdout.puts "Input too short. Try again."
  end

  def quit
    stdout.puts "\nNo! Don't go!"
  end

  def play
    stdout.puts "\nI have made the code!" +
                 "\nUse (q)uit at any time to end the game."
  end

  def response(input, results, guesses)
    stdout.puts "\n\n'#{input}' has #{results[1]} of the correct colors with #{results[0]} in the correct positions."
    stdout.puts "You've taken #{guesses} guesses."
  end

  def winner(code, guesses)
    stdout.puts "\n\nYou win! You guessed the correct code '#{code}' in #{guesses} guesses."

  end

  def enter_cheat_code
    stdout.print "Enter cheat code: "
  end

  def clear_screen
    stdout.print "\e[2J\e[f"
  end

end
