class Tile
  attr_reader :face_up

  def initialize
    @face_up = false
  end

  def self.create(board)

    #TODO loop through entire board
    # for each neighbor key get neighors
    #return a hash

    tile_values = get_tile_vals(board)
  end
    #neighbors hash eg: neighbors[[2,1]] == [[1,1],[3,1]......]
    #Hash of all neighbors complete, find bomb count for those positions

  end

  def reveal
    face_up = true
  end

  def get_tile_vals(board)
    tile_values = Hash.new { |h, k| h[k] = 0 }
    (0...board.size).each do |row|
      (0..board.size).each do |col|
        tile_value[[row, col]] += bomb_count(board, [row, col])
      end
    end
    tile_values
  end

  def bomb_count(board, pos)
    current_row = pos.first
    current_col = pos.last
    RELATIVE_POSITONS.select { |rel_pos| rel_pos == :b }.count
  end

end

RELATIVE_POSITONS = [
  [current_row + 1, current_col] #up
  [current_row + 1, current_col + 1] #up-right
  [current_row, current_col + 1] #right
  [current_row - 1, current_col + 1] #down-right
  [current_row - 1, current_col] #down
  [current_row - 1, current_col - 1] #down-left
  [current_row, current_col - 1] #left
  [current_row + 1, current_col - 1] #up-left
]
