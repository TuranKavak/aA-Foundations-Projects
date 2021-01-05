def select_even_nums(numbers)
    numbers.select(&:even?)
end
def reject_puppies(array)
    array.reject { |key,value| key["age"] < 3 }
end

def count_positive_subarrays(array1)
  array1.count { |subArray| subArray.sum > 2 }
end

def aba_translate(word)
 vowels = "aeiou"
 word.split("")
i = 0
while i < word.length
  if vowels.include?(word[i])
   word[i] += "b" + word[i]
   i += 2
  end
  i += 1
end
return word
end

def aba_array(array2)
 array2.map { |word| aba_translate(word) }
end