require 'byebug'

class Tile
  attr_reader :face_up

  RELATIVE_POSITONS = [
    [1, 0], #up
    [1, 1], #up-right
    [0, 1], #right
    [-1, 1], #down-right
    [-1, 0], #down
    [-1, -1], #down-left
    [0, -1], #left
    [1, -1] #up-left
  ]

  def initialize(bomb_count)
    @bomb_count = bomb_count
    @face_up = false
  end

  def self.create(board, row, col)
    tile_values = get_tile_vals(board)
    bomb_count = tile_values[[row,col]]

    self.new(bomb_count)
  end

  def reveal
    face_up = true
  end

  def self.get_tile_vals(board)
    tile_values = Hash.new { |h, k| h[k] = 0 }
    (0...board.size).each do |row|
      (0..board.size).each do |col|
        tile_values[[row, col]] += bomb_count(board, [row, col])
      end
    end
    tile_values
  end

  def self.bomb_count(board, pos)
    current_row = pos.first
    current_col = pos.last
    RELATIVE_POSITONS.select do |rel_pos|
      board[[rel_pos.first + current_row, rel_pos.last + current_col]] == :b
    end.count
  end

end
