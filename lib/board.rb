class Board
  attr_reader :grid
  def initialize(grid = [
             [0, 0, 0],
             [0, 0, 0],
             [0, 0, 0]
            ]
)
    @grid = grid
  end

  def display_board
    @grid.each do |row|
      count = 0
      print "  "
      row.each do |column|
        count += 1
        case
        when column == 1 then print 'X'
        when column == 2 then print 'O'
        else print '-'
        end
        count < 3 ? (print '|') : ()
      end
      puts ''
    end
  end

  def place_sign(row, column, sign)
    @grid[row][column] = sign
  end
end

