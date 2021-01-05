def palindrome?(word)
 i = word.length-1
 word1 = word.split("")
 newWord = ""
 while i >= 0
  newWord << word1[i]
  i -= 1
 end

 if newWord == word
  true
 else 
  false
 end 

end

def substrings(word)
    p word1 = word.split("")
    newSubStr = []
    i = 0
    j = 1

    while i <= word1.length-1
      newSubStr << word1[i]
     while j <= word1.length-1
        newSubStr << word1[i..j]*""
        j += 1
     end
     i += 1
     j = i + 1
    end
newSubStr
end

def palindrome_substrings(string)
 newArr = substrings(string)
 pali = []
 newArr.each do |word|
  if palindrome?(word) == true && word.length > 1
   pali << word
  end
 end
 return pali

end


