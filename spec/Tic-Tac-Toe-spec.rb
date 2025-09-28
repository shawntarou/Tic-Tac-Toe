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