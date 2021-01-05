class ComputerPlayer

    attr_accessor :mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position(legal_positions)
        pos = legal_positions.sample
        puts "Computer #{self.mark_value} chose position #{pos.to_s}"
        pos
    end

end