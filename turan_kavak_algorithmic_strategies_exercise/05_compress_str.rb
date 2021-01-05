# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".
def compress_str(str)
counter = 0
compressed_str = ""
    str.split("").each.with_index do |char, idx|
        if str[idx] == str[idx + 1]
            counter += 1
        else
            counter += 1
            if counter == 1 || counter == 0
                compressed_str << char
            else 
                compressed_str <<  counter.to_s + char
            end
            counter = 0
        end
    end 

compressed_str

end


p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
