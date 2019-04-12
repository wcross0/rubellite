# Alternator is a True/False toggler
class Alternator
  def initialize(val = true)
    @val = val
  end

  def alternate
    x = @val
    @val ^= true
    x
  end

  def value
    @val
  end

  alias check value
  alias _ value
  alias flip alternate
  alias :` alternate
end
