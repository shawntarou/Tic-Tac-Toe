require_relative 'lib/player'
require_relative 'lib/board'
require_relative 'lib/game_helpers'

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

# GAME LOOP
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
