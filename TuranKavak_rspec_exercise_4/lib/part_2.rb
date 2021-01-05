def proper_factors(num)
    (1...num).select { |i| num % i == 0 }
end

def aliquot_sum(num)
    proper_factors(num).inject(:+)
end

def perfect_number?(num)
    aliquot_sum(num) == num
end

def ideal_numbers(n)
    arr = []
    counter = 0
    i = 1
    while counter < n
        if perfect_number?(i)
            counter += 1
            arr << i
        end
        i += 1
    end
    arr
end


