def zip(*arrays)
    length = arrays.first.length
    (0...length).map do |i|
        arrays.map { |array| array[i] }
    end
end

def prizz_proc(arr, prc_1, prc_2)
    arr.select { |ele| (prc_1.call(ele) || prc_2.call(ele)) && !(prc_1.call(ele) && prc_2.call(ele)) }
end

def zany_zip(*arrays)
    current_length = 0
    max_length = 0
    length = arrays.first.length
    arrays.each do |array|
    current_length = array.length
      if current_length > max_length
        max_length = current_length
      end
    end
    #length = arrays.map(&:length).max
    
    (0...max_length).map do |i|
        arrays.map { |array| array[i] }
    end
end

def maximum(arr, &prc)
    return nil if arr.empty?
    current_length = 0
    max_length = 0
    current_ele = ""
    arr.each do |ele|
        current_length = prc.call(ele) 
        if current_length >= max_length
            max_length = current_length
            current_ele = ele
        end
    end
    current_ele
end

def my_group_by(arr, &prc)
    retHash = Hash.new { |h, k| h[k] = [] }
    arr.each do |ele|
        retHash[prc.call(ele)] << ele
    end
    retHash
end

def max_tie_breaker(arr, prc_1, &prc)
    return nil if arr.empty?
    max = arr.first
    arr.each do |el|
        if prc.call(el) > prc.call(max)
            max = el
        elsif prc.call(el) == prc.call(max)
            if prc_1.call(el) > prc_1.call(max)
                max = el
            end
        end
    end
    max

end
###

def silly_syllables(sentence)
    words = sentence.split(" ")
    ret_sen = words.map do |word|
        if count_vowels(word) < 2
            word
        else
            change_word(word)
        end
    end
    ret_sen.join(" ")
end

def change_word(word)
    vowels = ["a", "e", "i", "o", "u"]
    indices = []
    newWord = ""
    word.each_char.with_index do |char, idx|
        vowels.each do |vowel|
            if char == vowel
             indices << idx
            end
        end
    end
    newWord = word[indices.first..indices.last] 
end
def count_vowels(sentence)
    vowels = ["a", "e", "i", "o", "u"] #the same as %w[ a e i o u ]
    counter = 0
    sentence.split("").each do |char| 
      vowels.each do |vowel|
        if char == vowel
          counter += 1
        end
      end
    end
    counter
end


