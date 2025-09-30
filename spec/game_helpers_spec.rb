# frozen_string_literal: true

require_relative '../lib/board'
require_relative '../lib/player'
require_relative '../lib/game_helpers'

describe '#check_win' do
  context 'ROWS' do
    context 'when top row is filled' do
      it 'returns true' do
        board = Board.new([[1, 1, 1],
                           [0, 0, 0],
                           [0, 0, 0]])
        win_value = check_win(1, board)
        expect(win_value).to be true
      end
    end

    context 'when middle row is filled' do
      it 'returns true' do
        board = Board.new([[0, 0, 0],
                           [1, 1, 1],
                           [0, 0, 0]])
        win_value = check_win(1, board)
        expect(win_value).to be true
      end
    end

    context 'when bottom row is filled' do
      it 'returns true' do
        board = Board.new([[0, 0, 0],
                           [0, 0, 0],
                           [1, 1, 1]])
        win_value = check_win(1, board)
        expect(win_value).to be true
      end
    end
  end

  context 'COLUMNS' do
    context 'when left column is filled' do
      it 'returns true' do
        board = Board.new([[1, 0, 0],
                           [1, 0, 0],
                           [1, 0, 0]])
        win_value = check_win(1, board)
        expect(win_value).to be true
      end
    end

    context 'when middle column is filled' do
      it 'returns true' do
        board = Board.new([[0, 1, 0],
                           [0, 1, 0],
                           [0, 1, 0]])
        win_value = check_win(1, board)
        expect(win_value).to be true
      end
    end

    context 'when right column is filled' do
      it 'returns true' do
        board = Board.new([[0, 0, 1],
                           [0, 0, 1],
                           [0, 0, 1]])
        win_value = check_win(1, board)
        expect(win_value).to be true
      end
    end
  end

  context 'DIAGONALS' do
    context 'when left to right diagonal is filled' do
      it 'returns true' do
        board = Board.new([[1, 0, 0],
                           [0, 1, 0],
                           [0, 0, 1]])
        win_value = check_win(1, board)
        expect(win_value).to be true
      end
    end

    context 'when right to left diagonal is filled' do
      it 'returns true' do
        board = Board.new([[0, 0, 1],
                           [0, 1, 0],
                           [1, 0, 0]])
        win_value = check_win(1, board)
        expect(win_value).to be true
      end
    end
  end
end

describe '#check_tie' do
  context 'when it\'s a tie' do
    it 'returns true' do
      board = Board.new([[1, 2, 1],
                        [1, 2, 1],
                        [2, 1, 2]])
      is_tie = check_tie(board)
      expect(is_tie).to be true
    end
  end
end

describe '#get_win_message' do 
  let(:player_one) {Player.new('Player 1')} 
  let(:player_two) {Player.new('Player 2')} 

  before do
    allow(Kernel).to receive(:puts)
  end

  context 'when current player is player one' do
    it 'returns "The Winner is Player One"' do
      win_message = get_win_message(1, player_one, player_two)
      expect(win_message).to eq"The Winner is Player 1!"
    end
  end

  context 'when current player is player two' do
    it 'returns "The Winner is Player Two"' do
      win_message = get_win_message(2, player_one, player_two)
      expect(win_message).to eq"The Winner is Player 2!"
    end
  end
end
