# Timer is a better way of determining start_time - Time.now
class Timer
  attr_reader :start

  def initialize
    @start = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  end

  def elapsed
    end_s = (Process.clock_gettime(Process::CLOCK_MONOTONIC) - @start).to_i
    end_m = end_s / 60
    end_s %= 60
    [end_m, end_s]
  end

  def end
    @end ||= elapsed
  end

  def restart
    @start = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    @end = nil
    @start
  end
end
