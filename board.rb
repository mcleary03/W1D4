require_relative "tile.rb"

class Board
  attr_reader :size

  def initialize(size = 9, bombs = 10)
    @size = size
    @grid = Array.new(size) { Array.new(size) }
    seed(bombs)
    add_tiles
  end

  def add_tiles
    @grid.flatten.each_index do |idx|
      row = idx / size
      col = idx % size
      @grid[[row, col]] = Tile.create(@grid, row, col)
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

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  b.render
end
