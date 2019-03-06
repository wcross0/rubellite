class Alternator
  def initialize(i=true)
    @i = i
  end

  def alternate
    x = @i
    @i ^= true
    x
  end

  def value
    @i
  end
  
  alias_method :flip, :alternate
  alias_method :`, :alternate
  alias_method :check, :value
  alias_method :_, :value
end