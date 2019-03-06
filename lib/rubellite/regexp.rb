class Regexp
  def match?(*args)
    !match(*args).nil?
  end
end