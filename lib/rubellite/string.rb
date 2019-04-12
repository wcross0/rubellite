# Expanding the String class
class String
  def -(other)
    gsub(other, '')
  end

  def blank?
    /\A[[:space:]]*\z/ === self
  end

  # 
  def char_count(sort_by: 'order')
    h = Hash.new(0)
    chars { |c| h[c] += 1 }

    case sort_by
    when 'order' then h
    when 'count' then h.sort_by(&:last).reverse.to_h
    when 'alpha' then h.sort_by(&:first).to_h
    else
      raise ArgumentError, "Invalid sort_by option '#{sort_by}'"
    end
  end

  def digits(base = 10)
    to_i.digits(base)
  end

  def exclude?(obj)
    !include?(obj)
  end

  def pred
    ords = codepoints
    ords[-1] -= 1
    ords.map(&:chr).join
  end

  def pred!
    replace(pred)
  end

  def reverse_words
    spaces = chars.select { |x| x.match?(/[ \-_]/) }
    split(/[ \-_]/).map do |word|
      casing = word.chars.map do |c|
        if c.match?(/[A-Z]/)
          true
        else
          c.match?(/[^a-zA-Z \-_]/) ? nil : false
        end
      end
      letters = word.delete('^a-zA-Z').chars
      specials = word.delete('a-zA-Z').reverse.chars
      casing.map.with_index do |_x, i|
        if casing[i].nil?
          specials.pop
        else
          casing[i] ? letters.pop.upcase : letters.pop.downcase
        end
      end.join
    end.zip(spaces).join
  end

  def squish
    dup.squish!
  end

  def squish!
    gsub!(/\A[[:space:]]+/, '')
    gsub!(/[[:space:]]+\z/, '')
    gsub!(/[[:space:]]+/, ' ')
    self
  end

  def titlecase
    split.map(&:capitalize).join(' ')
  end

  def titlecase!
    replace(titlecase)
  end

  def to_a
    [dup]
  end

  alias / split
  alias prev pred
  alias prev! pred!
end
