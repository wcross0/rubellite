class Array
  def * (strary = nil)
    strary.class == String ? join(strary) : map { |x| strary.map { |y| x * y } }
  end

  def clockwise
    transpose.map(&:reverse)
  end

  def counter_clockwise
    transpose.reverse
  end

  def diff
    reduce(:-)
  end

  def drop(n=1, drop_lowest=true)
    drop_lowest ? sort[n..-1] : sort[0...-n]
  end

  def except(*indices)
    map.with_index { |x, i| indices.include?(i) ? nil : x }.compact
  end

  def except!(*indices)
    map!.with_index { |x, i| indices.include?(i) ? nil : x }.compact!
  end

  def exclude? (obj)
    !include?(obj)
  end

  def gcd
    reduce { |a, b| b.zero? ? a : b.gcd(a % b) }
  end

  def indices (*args, &block)
    map.with_index { |x, i| i if args.include?(x) || block&.call(x) }.compact
  end

  def mean (d=16)
    (sum.to_f / size).round(d)
  end

  def median
    s, l = sort, length
    l.odd? ? s[l/2] : s[l/2 - 1] + s[l/2] / 2.0
  end

  def mode
    group_by { |x| count(x) }.max_by(&:first).last.uniq.sort
  end

  def pairs
    (0...(length - 1)).map { |i| [self[i], self[i + 1]] }
  end

  def pretty_print(sep=', ')
    if all? { |x| x.is_a?(Array) }
      max = flatten.max_by { |x| x.to_s.length }.to_s.length
      each { |x| print x.map { |y| y.to_s.rjust(max, ' ') }.join(sep), "\n" }
    else
      print join(sep), "\n"
    end
    nil
  end

  def prod
    reduce(:*)
  end

  def split(&block)
    { true: select(&block), false: reject(&block) }
  end

  def squeeze
    chunk(&:itself).map(&:first)
  end

  def squeeze!
    self[0..-1] = chunk(&:itself).map(&:first)
  end

  def sum
    reduce(:+)
  end

  def swap (i, ii)
    swapped = dup
    swapped[i] = self[ii]
    swapped[ii] = self[i]
    swapped
  end

  def swap! (i, ii)
    self[0..-1] = swap(i, ii)
  end

  alias_method :cw, :clockwise
  alias_method :ccw, :counter_clockwise
  alias_method :anti_clockwise, :counter_clockwise
  alias_method :acw, :counter_clockwise
  alias_method :avg, :mean
end