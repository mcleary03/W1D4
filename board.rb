require_relative "tile.rb"

class Board

  def initialize(size = 9, bombs = 10)
    @size = size
    @grid = Array.new(size) { Array.new(size) }
    seed(bombs)
  end

  def seed(bombs)
    bomb_pos = []
    bombs.times { bomb_pos << [rng(@grid.length - 1), rng(@grid.length - 1)] }
    bomb_pos.each { |position| self[pos] = :b }
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

end
