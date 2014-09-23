# drive out correct colors in right spaces
# def new method to calc colors in right spaces
# def method for correct colors by removing correct
# guesses from guess and code


class CodeMaker

  attr_reader :code, :colors

  def initialize(code = nil)
    @colors = %W(r g b y)
    @code = code || generate_code
  end

  def compare(guess)
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

  def find_correct_positions(code, guess)
    positions = code.chars.zip(guess.chars)
    positions = positions.select {|x, y| x == y}
    positions.length
  end

  def find_correct_colors(code, guess)
    code.chars.uniq.count do |char|
      guess.include?(char)
    end
  end

  def generate_code
    4.times.map {colors.sample}.join
  end

end


"rrrr"

"grgr"

"rr"

"gg"
