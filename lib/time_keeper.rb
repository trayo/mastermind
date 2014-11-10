class TimeKeeper

  attr_reader :start, :stop, :seconds, :minutes

  def initialize(seconds = 0)
    @start = nil
    @stop = nil
    @seconds = 0
    @minutes = 0
  end

  def start
    @start = Time.now
  end

  def stop
    @stop = Time.now
  end

  def evaluate
    @seconds = (stop - start).to_i
    @minutes = ((stop - start) / 60).to_i
  end

end
