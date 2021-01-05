def duos(string)
    counter = 0
    (0...string.length-1).each do |num|
        counter += 1 if string[num] == string[num+1]
    end
    counter
end
#p duos('bootcamp')      # 1
#p duos('wxxyzz')        # 2
#p duos('hoooraay')      # 3
#p duos('dinosaurs')     # 0
#p duos('e')             # 0

def sentence_swap(sentence, hash)
    words = sentence.split(" ")
    newWords = []
    words.each do |word|
        if hash.keys.include?(word)
            newWords << hash[word]
        else
            newWords << word
        end
    end
    newWords.join(' ')
end

#p sentence_swap('anything you can do I can do',
#    'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
#) # 'nothing you shall drink I shall drink'
#
#p sentence_swap('what a sad ad',
#    'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
#) # 'make a happy ad'
#
#p sentence_swap('keep coding okay',
#    'coding'=>'running', 'kay'=>'pen'
#) # 'keep running okay'

def hash_mapped(hash, proc, &block)
    newHash = {}
    hash.each do |key, value|
        newHash[block.call(key)] = proc.call(value)
    end
    newHash
end

#double = Proc.new { |n| n * 2 }
#p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
## {"A!!"=>8, "X!!"=>14, "C!!"=>-6}
#
#first = Proc.new { |a| a[0] }
#p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
## {25=>"q", 36=>"w"}

def counted_characters(string)
    count = Hash.new(0)
    string.each_char { |char| count[char] += 1 }
    count.select { |char, num| num > 2 }
        .keys
end

#p counted_characters("that's alright folks") # ["t"]
#p counted_characters("mississippi") # ["i", "s"]
#p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
#p counted_characters("runtime") # []

def triplet_true(string)
    (0...string.length-2).each do |idx|
        if string[idx..idx+2] == string[idx] * 3
            return true
        end
    end
    false
end

#p triplet_true('caaabb')        # true
#p triplet_true('terrrrrible')   # true
#p triplet_true('runninggg')     # true
#p triplet_true('bootcamp')      # false
#p triplet_true('e')             # false

def energetic_encoding(string, hash)
    newString = []
    string.each_char do |char|
        if hash.has_key?(char)
            newString << hash[char]
        elsif !hash.has_key?(char)
            newString << "?"
        else
            newString << " "
        end
    end
    newString.join("")
end

#p energetic_encoding('sent sea',
#    'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
#) # 'zimp ziu'
#
#p energetic_encoding('cat',
#    'a'=>'o', 'c'=>'k'
#) # 'ko?'
#
#p energetic_encoding('hello world',
#    'o'=>'i', 'l'=>'r', 'e'=>'a'
#) # '?arri ?i?r?'
#
#p energetic_encoding('bike', {}) # '????'

def uncompress(string)
    newString = []
    (0..string.length-2).each do |idx|
        if idx % 2 == 0 
        newString << string[idx] * string[idx+1].to_i 
        end
    end
    newString.join("")
end

#p uncompress('a2b4c1') # 'aabbbbc'
#p uncompress('b1o2t1') # 'boot'
#p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

def conjunct_select(array, *procs)
    array.select { |ele| procs.all? { |proc| proc.call(ele) } }
end

#is_positive = Proc.new { |n| n > 0 }
#is_odd = Proc.new { |n| n.odd? }
#less_than_ten = Proc.new { |n| n < 10 }
#
#p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
#p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
#p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def convert_pig_latin(sentence)
    newWords = []
    words = sentence.split(" ")
    words.each do |word|
        if word.length < 3
            newWords << word
        else
            if word == word.capitalize
                newWords << change_word(word).capitalize
            else
                newWords << change_word(word)
            end
        end
    end
    newWords.join(" ")
end
def change_word(word)
    vowels = [ "a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
    return word + "yay" if vowels.include?(word[0])
    
    (0..word.length-1).each do |idx|
            if vowels.include?(word[idx])
                return word[idx..-1] + word[0...idx] + "ay"
            end
    end

end

#p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
#p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
#p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
#p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
#p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

def reverberate(sentence)
    newWords = []
    words = sentence.split(" ")
    words.each do |word|
        if word.length < 3
            newWords << word
        else
            if word == word.capitalize
                newWords << rev_word(word).capitalize
            else
                newWords << rev_word(word)
            end
        end
    end
    newWords.join(" ")
end

def rev_word(word)
    vowels = 'AEIOUaeiou'
    return word * 2 if vowels.include?(word[-1])

    (1..word.length-1).each do |idx|
            if vowels.include?(word[-idx])
                return word + word[-idx..-1] 
            end
    end

end

#p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
#p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
#p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
#p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

def disjunct_select(array, *procs)
    array.select { |ele| procs.any? { |proc| proc.call(ele) } }

end

longer_four = Proc.new { |s| s.length > 4 }
contains_o = Proc.new { |s| s.include?('o') }
starts_a = Proc.new { |s| s[0] == 'a' }

#p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#    longer_four,
#) # ["apple", "teeming"]
#
#p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#    longer_four,
#    contains_o
#) # ["dog", "apple", "teeming", "boot"]
#
#p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#    longer_four,
#    contains_o,
#    starts_a
#) # ["ace", "dog", "apple", "teeming", "boot"]

def alternating_vowel(sentence)
    words = sentence.split(" ")

    newWords = words.map.with_index do |word, idx|
        idx.even? ? first_vowel_remove(word) : last_vowel_remove(word)
    end
    newWords.join(" ")
end

def first_vowel_remove(word)
    vowels = 'AEIOUaeiou'

    (0..word.length-1).each do |idx|
            if vowels.include?(word[idx])
                return word[0...idx] + word[(idx+1)..-1] 
            end
    end
    word
end

def last_vowel_remove(word)
    first_vowel_remove(word.reverse).reverse
end

#p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
#p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
#p alternating_vowel('code properly please') # "cde proprly plase"
#p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

def silly_talk(sentence)
    vowels = 'AEIOUaeiou'

    words = sentence.split(" ")

    newWords = words.map.with_index do |word, idx|
        vowels.include?(word[-1]) ? word + word[-1] : vowel_change(word)
    end
    newWords.join(" ")
end
def vowel_change(word)
    vowels = 'AEIOUaeiou'

    newWord = []
    word.each_char do |char|
        if vowels.include?(char)
            newWord << char + "b" + char
        else
            newWord << char
        end
    end

    word == word.capitalize ? newWord.join("").capitalize : newWord.join("")
end

#p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
#p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
#p silly_talk('They can code') # "Thebey caban codee"
#p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

def compress(string)
    newString = []
    counter = 1
    (0..string.length-1).each do |i|
        if string[i] == string[i+1]
            counter += 1
        else
            counter == 1 ? newString << string[i] : newString << string[i] + counter.to_s
            counter  = 1
        end
    end
    newString.join("")
end

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"