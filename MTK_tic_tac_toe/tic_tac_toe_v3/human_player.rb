 
 class HumanPlayer
    attr_accessor :mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position(legal_positions)
        pos = nil
        until legal_positions.include?(pos)
            puts "Player #{mark_value.to_s}, enter two numbers representing a position in the format `row col` within #{legal_positions}"
            pos = gets.chomp.split(' ').map(&:to_i)
            puts "#{pos} is not a legal position" if !legal_positions.include?(pos)
            raise 'invalid, retry!' if pos.length != 2
        end
        pos
    end

 end