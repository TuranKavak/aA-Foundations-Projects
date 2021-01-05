
class Item

    def self.valid_date?(date_string)
        date = date_string.split('-').map(&:to_i)
        year, month, day = date
        return false if date.length != 3
        return false if !month.between?(1, 12)
        return false if !day.between?(1, 31)
        true
    end

    attr_reader :deadline, :done
    attr_accessor :title, :description

    def initialize(title, deadline, description)
        raise "invalid date..." if !Item.valid_date?(deadline)
        @title = title
        @deadline = deadline
        @description = description
        @done = false
    end

    def deadline=(new_deadline)
        raise 'deadline is not valid' if !Item.valid_date?(new_deadline)
        @deadline = new_deadline
    end

    def toggle
        @done = !@done
    end

end
