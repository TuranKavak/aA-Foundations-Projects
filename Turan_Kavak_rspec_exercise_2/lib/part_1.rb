def partition(arr, n)
    smallerN = []
    equalHigherN = []
    arr.each do |num|
        if num < n
            smallerN << num
        else
            equalHigherN << num
        end
    end
        return [smallerN, equalHigherN]
end


def merge(hash_1, hash_2)
hash_2 = hash_1.merge(hash_2)
end

def censor(sentence, curse_words)
    newSentence = sentence.split(" ").map do |word|
        if curse_words.include?(word.downcase)
            replace_word(word)
        else
            word
        end
    end
    newSentence.join(" ")
end

def replace_word(word)
        vowels = "aeiouAEIOU"
        newWord = ""
        word.each_char do |char|
            if vowels.include?(char)
                newWord << "*"
            else
                newWord << char
            end
        end
        newWord
end

def power_of_two?(num)
    i = 0
 while i < num
    if (2**i) == num
       return true
    end
    i += 1
 end
 false
end
