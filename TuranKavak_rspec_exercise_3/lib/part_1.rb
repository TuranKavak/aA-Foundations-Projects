def is_prime?(num)
    return false if num < 2
    (2...num).each do |i|
        if num % i == 0
            return false
        end
    end
    return true
end

def nth_prime(n)
    counter = 1
    i = 2
    while counter < n
        i += 1
        if is_prime?(i) 
            counter += 1
        end
    end
    i
end

def prime_range(min, max)
    range = []
    (min..max).each do |num|
        if is_prime?(num)
            range << num
        end
    end
    range
end