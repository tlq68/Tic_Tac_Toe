# spec/tic_tac_toe_spec.rb
require './lib/tic_tac_toe.rb'

describe Game do 
  subject(:game) { described_class.new('Player1', 'X') }
  let(:player2) { described_class.new('Player2', 'O') }
  let(:board) { game.instance_variable_get(:@board) }

  describe '#change_board' do
    before do
      game.setup_game
    end

    context 'when selecting a free spot' do
      it 'changes a spot to the player token' do        expect { game.change_board(game, '3') }.to change { game.board[0][2] }.to('X')
      end
    end

    context 'when selecting an already selected spot' do 
      before do 
        game.change_board(game, '3')
      end

      it 'does not change the spot' do 
        expect { game.change_board(player2, '3') }.to_not change { game.board[0][2] }
      end
    end

    context 'when improper input is given' do 
      it 'does not change the spot' do 
        expect { game.change_board(game, 'd') }.to_not change { game.board }
      end
    end
  end

  describe '#game_over?' do 
    context 'when top row is X X X' do 
      it 'returns true' do 
        game.board = [['X', 'X', 'X'], [4, 5, 6], [7, 8, 9]]
        expect(game.game_over?(game)).to be true
      end
    end

    context 'when middle row is O O O' do
      it 'returns true' do 
        game.board = [[1, 2, 3], ['O', 'O', 'O'], [7, 8, 9]]
        expect(game.game_over?(player2)).to be true
      end
    end

    context 'when bottom row is X X X' do 
      it 'returns true' do
        game.board = [[1, 2, 3], [4, 5, 6], ['X', 'X', 'X']]
        expect(game.game_over?(game)).to be true
      end
    end

    context 'when diagonal is O O O' do 
      it 'returns true' do 
        game.board = [['O', 2, 3], [4, 'O', 6], [7, 8, 'O']]
        expect(game.game_over?(player2)).to be true
      end
    end

    context 'when vertical line is X X X' do 
      it 'returns true' do 
        game.board = [[1, 2, 'X'], [4, 5, 'X'], [7, 8, 'X']]
        expect(game.game_over?(game)).to be true
      end
    end

    context 'when there is not three in a row' do 
      it 'returns false' do
        game.board = [['O', 2, 3], ['X', 5, 'O'], ['X', 'X', 9]]
        expect(game.game_over?(game)).to be false
      end
    end
  end

  describe '#tied_game?' do 
    context 'all spots are filled and no winner' do 
      it 'returns true' do 
        game.board = [%w(O O X), %w(X X O), %w(X X O)]
        expect(game.tied_game?).to be true
      end
    end

    context 'not all spots are filled' do 
      it 'returns false' do 
        game.board = [['O', 2, 3], ['X', 5, 'O'], ['X', 'X', 9]]
        expect(game.tied_game?).to be false
      end
    end
  end
end