class InputGetter
  attr_reader :input

  def initialize(stdin)
    @stdin = stdin
  end

  def get
    @input = @stdin.gets.downcase.strip
  end
end
