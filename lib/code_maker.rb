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

  private

  def generate_code
    4.times.map {colors.sample}.join
  end

end
