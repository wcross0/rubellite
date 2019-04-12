# Expands the Array class
class Array
  def *(strary = nil)
    if strary.class == String
      join(strary)
    else
      map { |x| strary.map { |y| x * y } }
    end
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

  def drop(count = 1, drop: :low)
    case drop
    when :low then sort[count..-1]
    when :high then sort[0...-count]
    when :rand then sample(length - count)
    else
      raise ArgumentError,
            "Invalid drop option #{drop}. Try :low, :high, or :rand"
    end
  end

  def except(*indices)
    map.with_index { |x, i| indices.include?(i) ? nil : x }.compact
  end

  def except!(*indices)
    map!.with_index { |x, i| indices.include?(i) ? nil : x }.compact!
  end

  def exclude?(obj)
    !include?(obj)
  end

  def gcd
    reduce { |a, b| b.zero? ? a : b.gcd(a % b) }
  end

  def indices(*args, &block)
    map.with_index { |x, i| i if args.include?(x) || block&.call(x) }.compact
  end

  def mean(decimals = 16)
    (sum.to_f / size).round(decimals)
  end

  def median
    s = sort
    l = length
    l.odd? ? s[l / 2] : s[l / 2 - 1] + s[l / 2] / 2.0
  end

  def mode
    uniq.group_by { |x| count(x) }.max.last
  end

  def pairs
    (0...(length - 1)).map { |i| [self[i], self[i + 1]] }
  end

  def pretty_print(sep = ', ')
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
    [select(&block).to_a, reject(&block).to_a]
  end

  def squeeze(obj = nil, &block)
    if block.nil?
      return chunk(&:itself).map(&:first) if obj.nil?

      chunk { |x| x == obj }.map { |x, y| x ? y.first : y }.flatten
    else
      chunk { |x| yield(x) rescue false }.map { |x, y| x ? y.first : y }.flatten
    end
  end

  def squeeze!(obj = nil, &block)
    self[0..-1] = squeeze(obj, &block)
  end

  def swap(index1, index2)
    swapped = dup
    swapped[index1] = self[index2]
    swapped[index2] = self[index1]
    swapped
  end

  def swap!(index1, index2)
    self[0..-1] = swap(index1, index2)
  end

  alias cw clockwise
  alias ccw counter_clockwise
  alias anti_clockwise counter_clockwise
  alias acw counter_clockwise
  alias avg mean
end
