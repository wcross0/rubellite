class Float
  def sep (s = ',', d = '.')
    m, f = to_s.split('.')
    m = m.reverse.split(/(...)/).reject(&:blank?).join(s).reverse
    m + d + f
  end

  def to_a
    [self]
  end
end