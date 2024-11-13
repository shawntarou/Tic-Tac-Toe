class Player
  attr_reader :name
  @@number_of_players = 0

  def initialize(name)
    @name = name
    @@number_of_players += 1
    @sign = @@number_of_players
    puts "Player ##{@@number_of_players}: #{@name}!"
  end

  def get_space
    space = [nil, nil]
    while space[0] == nil
      print 'Row: '
      user_input = gets.chomp.to_i - 1  
      if user_input < 0 || user_input > 2
        puts 'Invalid Row Number'
        next
      end
      space[0] = user_input
    end

    while space[1] == nil
      print 'Column: '
      user_input = gets.chomp.to_i - 1
      if user_input > 2 || user_input < 0
        puts 'Invalid Column Number'
        next
      end
      space[1] = user_input
    end
    return space
  end


  def make_move(board)
    space = get_space
    if board.grid[space[0]][space[1]] == 0
      board.place_sign(space[0], space[1], @sign)
    else
      puts "Space [#{space[0] + 1}, #{space[1] + 1}] is already taken!"
      make_move(board)
    end
  end

  def play_turn(board)
    puts "-----------------\n"
    puts "#{@name}'s Turn!"
    board.display_board
    make_move(board)
    


    # we also want to check whether there is a winner or tie
  end
end