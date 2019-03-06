require 'prime'

class Prime
  def factorization (n)
    Prime.prime_division(n).map { |x, y| Array.new(y).map { x } }.flatten
  end  
end