def hipsterfy(word)
    vowels = ("aeiou")
    newWord = word.split("")
    i = (word.length) -1

    while i > 0
      if vowels.include?(newWord[i])
        newWord[i] = ""
        break
      end
     i -= 1
    end
    return newWord.join
end


def vowel_counts(string)
 string = string.downcase
 string=string.split("")
 vowels = ("aeiou")
 string = string.select { |char| vowels.include?(char)}
 
 counter = Hash.new(0)
 string.each { |word| counter[word] += 1  }    
  return counter
end

def caesar_cipher(string, n)
    newStr = []
    alphabet = Array('a'..'z')
    str = string.split("")
    str.each do |char|
        if alphabet.include?(char)
            idx = alphabet.index(char) 
            newStr << alphabet[(idx + n) % 26]
        else
            newStr << char
        end
    end
    return newStr.join("")


end
