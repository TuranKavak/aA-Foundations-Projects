def range(range_start, range_end)

    return [] if range_start > range_end
    return [range(range_start,range_end-1 ),range_end].flatten
end

#p range(1, 5)

#iterative
def sum_array1(array)
    array.inject { |acc, ele|  acc += ele}
end

#p sum_array1([1, 2, 3, 4])
#recursive
def sum_array2(array)
    return 0 if array.empty?

    array.pop + sum_array2(array)

end
#p sum_array2([1, 2, 3, 4])

def exp(base, power_n)
    return 1 if power_n == 0 

    return base * exp(base, power_n-1)
end

def exp2(base, power_n)
    power_n == 0 ? 1 : base * exp(base, power_n-1)
end

#p exp(0,0)
#p exp(0,1)
#p exp(1,0)
#p exp(1,1)
#p exp(1,2)
#p exp(2,0)
#p exp(2,1)
#p exp(2,2)
#
#puts "------"
#
#p exp2(0,0)
#p exp2(0,1)
#p exp2(1,0)
#p exp2(1,1)
#p exp2(1,2)
#p exp2(2,0)
#p exp2(2,1)
#p exp2(2,256)

class Array
    def deep_dup
        newArray = []
        self.each do |ele|
            newArray << (ele.is_a?(Array) ? ele.deep_dup : ele)
        end
        newArray
    end
end
#p elo = [1, [2], [3, [4]]].deep_dup

def it_fib(n)
    arr = []
    a = 0
    b = 1

    while arr.length < n do
        arr << b
        a,b = b,a+b
    end

  arr
end
#p it_fib(3)

def rec_fib(n)
    if n <= 2
        [0, 1].take(n)
    else
        arr = rec_fib(n-1)
        arr << arr[-2] + arr[-1]
    end
end

#p rec_fib(4)

def bsearch(array, target)

    return nil if array.empty?

    probe_index = array.length/2

    case target <=> array[probe_index]
    when -1
        bsearch(array.take(probe_index), target)
    when 0
        probe_index
    when 1
        rec = bsearch(array.drop(probe_index + 1), target)
        rec.nil? ? nil : (probe_index + 1) + rec
    end
end


#p bsearch([1, 2, 3], 1) # => 0
#p bsearch([2, 3, 4, 5], 3) # => 1
#p bsearch([2, 4, 6, 8, 10], 6) # => 2
#p bsearch([1, 3, 4, 5, 9], 5) # => 3
#p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
#p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
#p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

class Array
    def merge_sort
        return self if count < 2

        index = count / 2

        left_half, right_half = self.take(index), self.drop(index)
        s_left, s_right = left_half.merge_sort, right_half.merge_sort

        merge(s_left,s_right)

    end

    def merge(left,right)
        merged = []

        until left.empty? || right.empty?
        merged << (left.first < right.first) ? left.shift : right.shift
        end

        merged + left + right
    end
end
class Array

    def subsets
        return [[]] if empty? 

        subs = take(count - 1).subsets
        subs.concat(subs.map { |sub| sub + [last] })
    end

end

 #p [].subsets
 #p [1].subsets
 #p [1, 2].subsets
 #p [1, 2, 3].subsets

 def permutations(array)
    return [array] if array.length <= 1

    first = array.shift
    perms = permutations(array)

    total_permutations = []

    perms.each do |perm|
        (0..perm.length).each do |i|
            total_permutations << perm[0...i] + [first] + perm[i..-1]
        end
    end

    total_permutations
 end

 #p permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
                        #     [2, 1, 3], [2, 3, 1],
                        #     [3, 1, 2], [3, 2, 1]]

#def make_change(amount, coins = [25, 10, 5, 1])
#
#end

def make_change(amount,coins = [25, 10, 5, 1])

    return [] if amount == 0 
    return nil if coins.none? { |coin| coin <= amount }

    coins = coins.sort.reverse

    best_change = nil

    coins.each_with_index do |coin, index|
        next if coin > amount

        remainder = amount - coin

        best_remainder = make_change(remainder, coins.drop(index))

        next if best_remainder.nil?

        this_change = [coin] + best_remainder

        if best_change.nil? || ( best_change.length > this_change.length)
            best_change = this_change
        end
    end
    best_change

end

#p make_change(50)




