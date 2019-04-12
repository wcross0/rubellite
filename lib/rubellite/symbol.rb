# Expands the Symbol class
class Symbol
  def with(*args, &block)
    ->(caller, *rest) { caller.send(self, *rest, *args, &block) }
  end

  alias call with
end
