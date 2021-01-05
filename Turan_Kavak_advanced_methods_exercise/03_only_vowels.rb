# Write a method, `only_vowels?(str)`, that accepts a string as an arg.
# The method should return true if the string contains only vowels.
# The method should return false otherwise.
def only_vowels?(str)
counter = 0
vowels = "aeiou" 
str.split("").each do |char|
    if vowels.include?(char)
        counter += 1
    end
end
if counter == str.length
    true
else
    false
end


end


p only_vowels?("aaoeee")  # => true
p only_vowels?("iou")     # => true
p only_vowels?("cat")     # => false
p only_vowels?("over")    # => false


