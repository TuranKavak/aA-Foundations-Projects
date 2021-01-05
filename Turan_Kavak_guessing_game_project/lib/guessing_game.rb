class GuessingGame

    def initialize(min, max)
    @min = min
    @max = max
    @secret_num = rand(min..max)
    @num_attempts = 0
    @game_over = false
    end

    def num_attempts
        return @num_attempts
    end

    def game_over?
        return @game_over
    end
    
    def check_num(number)
        @number = number
        @num_attempts += 1
        @game_over = true if number == @secret_num 
        if @secret_num == number
        p 'you win'
        end
        if @secret_num < number 
        p 'too big'
        end   
        if @secret_num > number 
        p 'too small'
        end  
    end   

    def ask_user
    p 'enter a number'
    num = gets.chomp.to_i
    check_num(num)
    end
end
