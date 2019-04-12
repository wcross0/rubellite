# Expands the Integer class
class Integer
  def chars
    to_s.chars
  end

  def d(sides = 6)
    [*1..self].map { rand(sides) + 1 }
  end

  def factorial
    [*1..self].prod
  end

  def factors
    m = even? ? 2 : 3
    [*1..div(m)].map { |n| n if modulo(n).zero? }.compact << self
  end

  def half
    div(2)
  end

  def one?
    self == 1
  end

  def pred
    self - 1
  end

  def reverse
    chars.reverse.join.to_i
  end

  def sep(separator = ',')
    to_s.reverse
        .split(/(...)/)
        .reject(&:blank?)
        .join(separator)
        .reverse
  end

  def to_a
    [self]
  end

  def two?
    self == 2
  end

  alias prev pred
end
