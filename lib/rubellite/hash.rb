# Expands the Hash class
class Hash
  def pop
    k = keys[-1]
    x = [k, self[k]]
    delete(k)
    x
  end

  def shift
    k = keys[0]
    x = [k, self[k]]
    delete(k)
    x
  end

  def grid(default = false)
    Hash.new do |x_hash, x_key|
      x_hash[x_key] = Hash.new { |y_hash, y_key| y_hash[y_key] = default }
    end
  end
end
