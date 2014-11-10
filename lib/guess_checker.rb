 class GuessChecker

  def self.compare(code, guess)
    if code == guess
      correct_positions = 4
      correct_colors = 0
    else
      correct_positions = find_correct_positions(code, guess)
      correct_colors = find_correct_colors(code, guess)
    end

    return [correct_positions, correct_colors]
  end

  private

  def self.find_correct_positions(code, guess)
    positions = code.chars.zip(guess.chars)
    positions.count {|x, y| x == y}
  end

  def self.find_correct_colors(code, guess)
    code.chars.uniq.count do |char|
      guess.include?(char)
    end

  end

end
