# Expands the Time class
class Time
  # A random time
  #
  # @return [String] a random time between 00:00 and 23:59
  def self.rand
    hh = [*0..23].sample.to_s.rjust(2,"0")
    mm = [*0..59].sample.to_s.rjust(2,"0")
    "#{hh}:#{mm}"
  end
end
