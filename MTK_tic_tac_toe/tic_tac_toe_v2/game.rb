require './board.rb'
require './human_player.rb'

class TTTGame

    def initialize(size, *players_marks)
        @players = players_marks.map { |mark| HumanPlayer.new(mark) }
        @current_player = @players.first
        @board = Board.new(size)
    end

    def switch_turn
        @players.rotate!
        @current_player = @players.first
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