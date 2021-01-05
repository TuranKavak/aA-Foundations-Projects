require './board.rb'
require './human_player.rb'
require './computer_player.rb'

class TTTGame

    def initialize(size, players_marks)
        @players = players_marks.map do |mark, is_computer|
            is_computer ? ComputerPlayer.new(mark) : HumanPlayer.new(mark)
        end
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
            choices = @board.legal_positions
            position = @current_player.get_position(choices)
            @board.place_mark(position, @current_player.mark_value)#hw to get cp marks
            if @board.win?(@current_player.mark_value)
                puts 'Game Over'
                puts @current_player.mark_value.to_s + ' HAS WON!'
                return
            else
                switch_turn
            end
        end
        puts 'Game Over'
        puts 'DRAW'
    end

end