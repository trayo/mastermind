class InputGetter

  attr_reader :input

  def initialize
    @input = ""
  end

  def get
    @input = gets.strip.downcase
  end

end
