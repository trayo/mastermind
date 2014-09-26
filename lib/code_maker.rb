class CodeMaker

  attr_reader :code, :colors

  def initialize(code = nil)
    @colors = %W(r g b y)
    @code = code || generate_code
  end

  private

  def generate_code
    4.times.map do
      colors.sample
    end.join
  end

end
