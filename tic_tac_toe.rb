class Game
    attr_accessor :spot1, :spot2, :spot3, :spot4, :spot5, :spot6, :spot7, :spot8, :spot9
    attr_accessor :input

    attr_accessor :name, :token

    @@turn_counter = 0
    @@winner = false

    

    def initialize(name, token) 
        @name = name
        @token = token
    end

    def input
        @input = input
    end
    
    def spots
        @spot1 = "1"
        @spot2 = "2"
        @spot3 = "3"
        @spot4 = "4"
        @spot5 = "5"
        @spot6 = "6"
        @spot7 = "7"
        @spot8 = "8"
        @spot9 = "9" 
    end

    def player_input(player1, player2, current_player=player1)

        loop do 

            if @@turn_counter % 2 == 0
                current_player = player1
            elsif @@turn_counter % 2 != 0
                current_player = player2
            end

            puts "Make a choice, #{current_player.name}."
            input = gets.chomp.downcase
            choices =   
                case input
                when '1'
                     if @spot1 == '1'
                        @spot1 = current_player.token
                        @@turn_counter += 1
                     end
                when '2'
                    if @spot2 == '2'
                        @spot2 = current_player.token
                        @@turn_counter += 1
                     end
                when '3'
                    if @spot3 == '3'
                        @spot3 = current_player.token
                        @@turn_counter += 1
                     end
                when '4'
                    if @spot4 == '4'
                        @spot4 = current_player.token
                        @@turn_counter += 1
                    end
                when '5'
                    if @spot5 == '5'
                        @spot5 = current_player.token
                        @@turn_counter += 1
                    end
                when '6'
                    if @spot6 == '6'
                        @spot6 = current_player.token
                        @@turn_counter += 1
                    end
                when '7'
                    if @spot7 == '7'
                        @spot7 = current_player.token
                        @@turn_counter += 1
                    end
                when '8'
                    if @spot8 == '8'
                        @spot8 = current_player.token
                        @@turn_counter += 1
                    end
                when '9'
                    if @spot9 == '9'
                        @spot9 = current_player.token
                        @@turn_counter += 1
                    end
                else 
                    puts "\nNot a good input"
                end    
                
                self.print_grid
                if @spot1 == current_player.token && @spot2 == current_player.token && @spot3 == current_player.token
                    puts "#{current_player.name} won!"
                    break
                end

                if @spot4 == current_player.token && @spot5 == current_player.token && @spot6 == current_player.token
                    puts "#{current_player.name} won!"
                    break
                end

                if @spot7 == current_player.token && @spot8 == current_player.token && @spot9 == current_player.token
                    puts "#{current_player.name} won!"
                    break
                end

                if @spot1 == current_player.token && @spot4 == current_player.token && @spot7 == current_player.token
                    puts "#{current_player.name} won!"
                    break
                end

                if @spot2 == current_player.token && @spot5 == current_player.token && @spot8 == current_player.token
                    puts "#{current_player.name} won!"
                    break
                end

                if @spot3 == current_player.token && @spot6 == current_player.token && @spot9 == current_player.token
                    puts "#{current_player.name} won!"
                    break
                end

                if @spot1 == current_player.token && @spot5 == current_player.token && @spot9 == current_player.token
                    puts "#{current_player.name} won!"
                    break
                end

                if @spot3 == current_player.token && @spot5 == current_player.token && @spot7 == current_player.token
                    puts "#{current_player.name} won!"
                    break
                end

                if @spot1 != '1' && @spot2 != '2' && @spot3 != '3' && @spot4 != '4' && @spot5 != '5' && @spot6 != '6' && @spot7 != '7' && @spot8 != '8' && @spot9 != '9'
                    puts "You tied :/"
                    break
                end
            break if input == 'q'
        end
    end

    def print_grid
        puts ""
        puts "  #{@spot1} | #{@spot2} | #{@spot3} "
        puts " ---|---|--- "
        puts "  #{@spot4} | #{@spot5} | #{@spot6} "
        puts " ---|---|--- "
        puts "  #{@spot7} | #{@spot8} | #{@spot9} "
        puts ""
    end

    def play(current_player, next_player)
        self.spots
        self.print_grid
        puts "Type 'Q' at any time to quit."
        self.player_input(current_player, next_player)
    end

    def win(current_player)
       puts "Hurray! #{@current_player.name} won!" 
    end
end



player1 = Game.new("Player1", "X")
player2 = Game.new("Player2", "O")

player2.play(player1, player2)