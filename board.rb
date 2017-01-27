require_relative "tile.rb"

class Board

  def initialize(size = 9, bombs = 10)
    @size = size
    @grid = Array.new(size) { Array.new(size) }
    seed(bombs)
  end

  def add_tile
    @grid.flatten.each do |el|
      el = Tile.create(@grid)
    end
  end

  def seed(bombs)
    bomb_pos = []
    bombs.times { bomb_pos << [rand(@grid.length - 1), rand(@grid.length - 1)] }
    bomb_pos.each { |position| self[position] = :b }
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def render
    @grid.each{ |row| print "#{row}\n"}
  end
end

b = Board.new
b.render
