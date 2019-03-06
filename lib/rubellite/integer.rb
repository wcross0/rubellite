class Integer
  def chars
    to_s.chars
  end

  def d(x=6)
    [*1..self].map { |n| rand(x) + 1 }
  end

  def digits (base = 10)
    raise Math::DomainError, "out of domain #{self}" if self < 0
    to_s(base).chars.map(&:to_i).reverse
  end

  def factorial
    [*1..self].prod
  end

  def factors
    even? ? (1).upto(div(2)).map{ |n| n if modulo(n).zero? }.compact << self : (1).upto(div(3)).map{ |n| n if modulo(n).zero? }.compact << self
  end

  def half
    div(2)
  end

  def pred
    self - 1
  end

  def reverse
    chars.reverse.join.to_i
  end

  def sep (s = ',')
    to_s.reverse.split(/(...)/).reject(&:blank?).join(s).reverse
  end

  def to_a
    [self]
  end

  alias_method :prev, :pred
end