require './board.rb'
require './human_player.rb'

class TTTGame

    def initialize(player_1_mark, player_2_mark)
        @human_player1 = HumanPlayer.new(player_1_mark)
        @human_player2 = HumanPlayer.new(player_2_mark)
        @current_player = @human_player1
        @board = Board.new
    end

    def switch_turn
        if @current_player == @human_player1
            @current_player = @human_player2
        else
            @current_player = @human_player1
        end
    end

    def play
        while @board.empty_positions?
            @board.print
            position = @current_player.get_position
            @board.place_mark(position, @current_player.mark_value)#hw to get cp marks
            if @board.win?(@current_player.mark_value)
                puts 'Game Over'
                puts @current_player.mark_value.to_s + ' HAS WON!'
                return
            else
                self.switch_turn
            end
        end
        puts 'Game Over'
        puts 'DRAW'
    end

end