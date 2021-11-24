#require './spec/tic_tac_toe_spec.rb'

class Game
  attr_accessor :name, :token, :board, :turn_counter

  def initialize(name, token)
    @name = name
    @token = token
  end

  def play(current_player)
    setup_game
    puts "Type 'Q' at any time to quit."
    player_input(current_player)
  end

  def setup_game
    @turn_counter = 0
    @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def player_input(player1, current_player=player1)
    player2 = Game.new('Player2', 'O')
    loop do
      if @turn_counter.even?
        current_player = player1
      elsif @turn_counter.odd?
        current_player = player2
      end

      puts "Make a choice, #{current_player.name}."
      print_grid
      input = gets.chomp.downcase
      change_board(current_player, input)
      win(current_player) if game_over?(current_player) == true
      break if game_over?(current_player) == true

      tie if tied_game? == true
      break if tied_game? == true
      break if input == 'q'
    end
  end

  def print_grid
    puts ''
    puts "  #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]} "
    puts ' ---|---|--- '
    puts "  #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]} "
    puts ' ---|---|--- '
    puts "  #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]} "
    puts ''
  end

  def change_board(current_player, input)
    (0...3).each do |row|
      (0...3).each do |spot|
        if input.to_i == board[row][spot]
          board[row][spot] = current_player.token
          @turn_counter += 1
        end
      end
    end
  end

  def game_over?(current_player)
    # 1, 2, 3
    return true if board[0].all? { |x| x == current_player.token }
    # 4, 5, 6
    return true if board[1].all? { |x| x == current_player.token }
    # 7, 8, 9
    return true if board[2].all? { |x| x == current_player.token }
    # 1, 5, 9
    return true if board[0][0] == board[1][1] && board[1][1] == board[2][2]
    # 3, 5, 7
    return true if board[0][2] == board[1][1] && board[1][1] == board[2][0]

    # 1, 4, 7
    # 2, 5, 8
    # 3, 6, 9
    (0...3).each do |spot|
      return true if board[0][spot] == board[1][spot] && board[1][spot] == board[2][spot]
    end
    
    return false
  end

  def win(current_player)
    print_grid
    puts "Hurray! #{current_player.name} won!"
  end

  def tied_game?
    all_spots_filled = true
    board.each do |row|
      row.each do |spot|
        if spot.is_a?(Integer)
          all_spots_filled = false
          break
        end
      end
    end
    all_spots_filled
  end

  def tie
    puts 'You tied :/'
  end
end

player1 = Game.new('Player1', 'X')

player1.play(player1)
