class InputGetter

  attr_reader :input

  def initialize
    @input = ""
  end

  def get
    @input = gets.downcase.strip
  end

end
