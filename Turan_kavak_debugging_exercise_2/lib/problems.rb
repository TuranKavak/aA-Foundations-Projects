# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(number)
    dividers = []
    (2..number).each do |factor|
        if number % factor == 0
          dividers << factor
        end
    end  
    retNum = 0
    dividers.each do |i|
     if prime?(i) == true
      retNum = i
     end
    end
    retNum
end

def prime?(num)
    
  if num < 2
    return false
  end

  (2...num).each do |factor|
    if num % factor == 0
      return false
    end
  end

  return true
end

def unique_chars?(string)
    i = 0
    j = 1
    string1 = string.split("")
    while i < string1.length
        while j < string1.length
            if string1[i] == string1[j]
                return false
            end
            j += 1
        end
        
        i += 1
        j = i +1
    end
    return true
end


def dupe_indices(arr)
  indices = Hash.new { |h, k| h[k] = [] }
  arr.each.with_index do |ele, idx|
    indices[ele] << idx
  end
  indices.select { |key, val| val.length > 1}
end




def ana_array(arr1, arr2)
  newArr = arr1.each.map { |word| true if arr2.include?(word) }

  newArr2 = arr2.each.map { |word| true if arr1.include?(word) }
  if newArr.include?(nil) || newArr2.include?(nil)
   return false 
  end
  true
end