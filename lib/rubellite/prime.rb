require 'prime'

# Expands the Prime class
class Prime
  def factorization(num)
    Prime.prime_division(num)
         .map { |x, y| Array.new(y, x) }
         .flatten
  end
end
