class String
  def - (streg)
    gsub(streg, '') 
  end

  def blank?
    /\A[[:space:]]*\z/ === self
  end

  def char_count
    h = Hash.new(0)
    chars { |c| h[c] += 1 }
    h
  end

  def digits (base = 10)
    to_i.digits(base)
  end

  def exclude? (obj)
    !include?(obj)
  end

  def match? (regex)
    match(regex) ? true : false
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
      casing = word.chars.map { |c| c.match?(/[A-Z]/) ? true : c.match?(/[^a-zA-Z \-_]/) ? nil : false }
      letters = word.delete("^a-zA-Z").chars
      specials = word.delete("a-zA-Z").reverse.chars
      casing.map.with_index { |x, i| casing[i].nil? ? specials.pop : casing[i] ? letters.pop.upcase : letters.pop.downcase }.join
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
    split.map(&:capitalize).join(" ")
  end

  def titlecase!
    replace(titlecase)
  end

  def to_a
    [dup]
  end
  
  alias_method :/, :split
  alias_method :prev, :pred
  alias_method :prev!, :pred!
end