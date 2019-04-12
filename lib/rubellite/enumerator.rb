# Expands the Enumerator class
class Enumerator
  def and(other)
    (to_a + other.to_a).to_enum
  end
end
