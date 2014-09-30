gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/time_keeper'

class TimeKeeperTest

  def test_it_evaluates_time
    time = TimeKeeper.new
    time.start
    
  end

end
