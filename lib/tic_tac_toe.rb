class Game
  attr_accessor :name, :token, :board, :turn_counter

  def initialize(name, token)
    @name = name
    @token = token
  end

  def play(current_player)
    @turn_counter = 0
    @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    puts "Type 'Q' at any time to quit."
    player_input(current_player)
  end

  def player_input(player1, current_player=player1)
    player2 = Game.new('Player2', '0')
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
      game_over?(current_player)
      tied_game?
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
    win(current_player) if board[0].all? { |x| x == current_player.token }
    # 4, 5, 6
    win(current_player) if board[1].all? { |x| x == current_player.token }
    # 7, 8, 9
    win(current_player) if board[2].all? { |x| x == current_player.token }
    # 1, 5, 9
    if board[0][0] == board[1][1] && board[1][1] == board[2][2]
      win(current_player)
    end
    # 3, 5, 7
    if board[0][2] == board[1][1] && board[1][1] == board[2][0]
      win(current_player)
    end
    # 1, 4, 7
    # 2, 5, 8
    # 3, 6, 9
    (0...3).each do |spot|
      if board[0][spot] == board[1][spot] && board[1][spot] == board[2][spot]
        win(current_player)
      end
    end
  end

  def win(current_player)
    print_grid
    puts "Hurray! #{current_player.name} won!"
    exit
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

    if all_spots_filled == true
      puts 'You tied :/'
      exit
    end
  end
end

player1 = Game.new('Player1', 'X')

player1.play(player1)
