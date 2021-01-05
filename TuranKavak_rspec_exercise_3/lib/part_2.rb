def element_count(array)
    counter = Hash.new(0)
    array.each do |i|
        counter[i] += 1
    end
    counter
end

def char_replace!(str, hash)
    str.each_char.with_index do |char, idx|
        if hash.has_key?(char)
            str[idx] = hash[char]
        end
    end
    str
end

def product_inject(array)
array.inject(:*)
end
