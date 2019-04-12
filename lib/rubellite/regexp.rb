# Expands the Regexp class
class Regexp
  def match?(*args)
    !match(*args).nil?
  end
end
