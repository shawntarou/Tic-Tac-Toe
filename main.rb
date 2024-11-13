require_relative 'lib/player'
require_relative 'lib/board'

# print 'Player 1 Name: '
player_one_name = 'tyler' #gets.chomp
player_one = Player.new(player_one_name)

# print 'Player 2 Name: '
player_two_name = 'moopa' #gets.chomp
player_two = Player.new(player_two_name)

game_board = Board.new
game_over = false

current_player = 1
tie = false

def get_win_message(current_player, player_one, player_two)
  winning_player = ''
  current_player == 1 ? winning_player = player_one : winning_player = player_two
  return "The Winner is #{winning_player.name}!"
end

def check_win(current_player, board)
  row_check_num = 0
  rows_checked = false

  column_check_num = 0
  columns_checked = false
  
  while rows_checked == false
    if (board.grid[row_check_num][0] == current_player) && (board.grid[row_check_num][1] == current_player) && (board.grid[row_check_num][2] == current_player)
      return true
    end
    row_check_num == 2 ? rows_checked = true : row_check_num += 1
  end

  while columns_checked == false
    if (board.grid[0][column_check_num] == current_player) && (board.grid[1][column_check_num] == current_player) && (board.grid[2][column_check_num] == current_player)
      return true
    end
    column_check_num == 2 ? columns_checked = true : column_check_num += 1
  end

  if (board.grid[0][0] == current_player) && (board.grid[1][1] == current_player) && (board.grid[2][2] == current_player)
    return true
  end

  if (board.grid[0][2] == current_player) && (board.grid[1][1] == current_player) && (board.grid[2][0] == current_player)
    return true
  end
  return false
end

def check_tie(board)
  board.grid.each do |row|
    row.each do |column|
      if column == 0
        return false
      end
    end
  end
  tie = true
  return true
end

while game_over == false
    if current_player == 1
      player_one.play_turn(game_board)
      game_over = check_win(current_player, game_board)
      current_player = 2
    else
      player_two.play_turn(game_board)
      game_over = check_win(current_player, game_board)
      current_player = 1
    end
    tie = check_tie(game_board)
end

current_player == 1 ? current_player = 2 : current_player = 1

puts "-----------------\n"
if tie != true
  puts get_win_message(current_player, player_one, player_two)
else 
  puts "It's a tie!"
end

game_board.display_board
