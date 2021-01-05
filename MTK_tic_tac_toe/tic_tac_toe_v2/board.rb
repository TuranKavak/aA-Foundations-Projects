require 'matrix'

class Board
    def initialize(size)
        @grid = Array.new(size) { Array.new(size, '_') }
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, value)
        row, col = pos
        @grid[row][col] = value
    end

    def valid?(position)
        row, col = position
        position.all? do |i|
            i >= 0 && i < @grid.length
        end   
    end

    def empty?(position)
        self[position] == '_'
    end

    def place_mark(position, mark)
        raise "#{position} invalid mark" if !valid?(position) || !empty?(position)
        self[position] = mark
    end

    def print
        @grid.each do |row|
            p row
        end
    end

    def win_row?(mark)
        @grid.any? { |row| row.all?(mark) }
    end

    def win_col?(mark)
        @grid.transpose.any? { |col| col.all?(mark) }
    end

    def win_diagonal?(mark)
        (Matrix.rows(@grid).each(:diagonal).to_a).all?(mark)
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.any? { |row| row.any?('_') }
    end
end