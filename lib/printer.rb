# display instructions
# display score with time
# display intro screen
# display when user gets answer right
# display when user gets answer wrong
# display when game ends


class Printer

  def startup
    puts "\nWelcome to MASTERMIND"
    start_screen
  end

  def enter_command
    print "\nEnter a command: "
  end

  def start_screen
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def instructions
    puts "Here lies Instructions, may he rest in peace."
  end

  def invalid_input
    puts "Invalid input."
  end

  def quit
    puts "Good bye!"
  end

  def play
    puts "Thanks for playing."
  end

  # def win
  #
  # end

end
