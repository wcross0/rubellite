# Expands the Float class
class Float
  def one?
    self == 1
  end

  def sep(separator = ',', decimal = '.')
    m, f = to_s.split('.')
    m = m.reverse
         .split(/(...)/)
         .reject(&:blank?)
         .join(separator)
         .reverse
    m + decimal + f
  end

  def to_a
    [self]
  end

  def two?
    self == 2
  end
end
