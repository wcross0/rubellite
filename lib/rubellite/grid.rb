# Creates a dynamic hash-based grid
class Grid
  def initialize(default: false)
    @default = default
    @grid = Hash.new do |x_hash, x_key|
      x_hash[x_key] = Hash.new(@default)
    end
  end

  def to_s
    @grid.to_s
  end

  def draw
    x_min, x_max = @grid.keys.minmax
    y_min, y_max = @grid.values.flat_map(&:keys).minmax
    drawing = [*y_min..y_max].map.with_index do |_y, j|
      [*x_min..x_max].map.with_index { |_x, i| @grid[i][j] ? '█' : '·' }
    end
    drawing.pretty_print('')
  end

  def [](val)
    @grid[val]
  end

  def []=(val, other)
    @grid[val] = other
  end
end
