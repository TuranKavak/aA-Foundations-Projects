 
 class HumanPlayer
    attr_accessor :mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position
        puts "Player #{mark_value.to_s}, enter two numbers representing a position in the format `row col`"
        pos = gets.chomp.split(' ').map(&:to_i)
        raise 'invalid, retry!' if pos.length != 2
        pos
    end

 end