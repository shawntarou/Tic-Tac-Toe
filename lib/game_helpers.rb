# this should really be a module

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