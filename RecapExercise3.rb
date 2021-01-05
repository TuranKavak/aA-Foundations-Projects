def no_dupes?(arr)
    (0..arr.length-1).each do |i|
        (0..arr.length-1).each do |j|
            arr.delete(arr[j]) if arr[i] == arr[j] && i < j
        end
    end
    arr
end

# Examples
# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
    (0..arr.length-1).each do |i|
           return false if arr[i] == arr[i+1]
    end
    true
end

# Examples
# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
  indices = Hash.new { |h, k| h[k] = [] }
  str.each_char.with_index { |char, i| indices[char] << i }
  indices
end

# Examples
# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
  current = ""
  longest = ""

  (0...str.length).each do |i| 
    if str[i] == str[i-1] || i == 0
      current += str[i]
    else
      current = str[i]
    end
    if current.length >= longest.length
      longest = current
    end
    end
  longest
end

# Examples
# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'

def bi_prime?(num)
  array = []
  (2...num).each do |i|
    if num % i == 0
      array << i
    end
  end
  return true if array.length == 1 || array.length == 2
  return false
end

# Examples
# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

#p bi_prime?(10)

def vigenere_cipher(message, keys)
  encrypted_word = ""

message.each_char.with_index do |char, i|
  key = keys[i % keys.length]
  index = LETTER_TO_INDEX[char]

  if (index + key) < 26
    encrypted_word << INDEX_TO_LETTER[index + key]
  else
    encrypted_word << INDEX_TO_LETTER[index + key - 26]
  end 
end 
encrypted_word 
end 

INDEX_TO_LETTER = {0=>"a", 1=>"b", 2=>"c", 3=>"d", 4=>"e", 5=>"f", 6=>"g", 7=>"h", 8=>"i", 9=>"j", 10=>"k", 11=>"l", 12=>"m", 13=>"n", 14=>"o", 15=>"p", 16=>"q", 17=>"r", 18=>"s", 19=>"t", 20=>"u", 21=>"v", 22=>"w", 23=>"x", 24=>"y", 25=>"z"}

LETTER_TO_INDEX = {"a"=>0,"b"=> 1,"c"=> 2,"d"=> 3,"e"=> 4,"f"=> 5,"g"=> 6,"h"=> 7,
"i"=> 8,"j"=> 9, "k"=>10, "l"=>11, "m"=>12, "n"=>13, "o"=>14, "p"=>15, "q"=>16, "r"=>17, "s"=>18, "t"=>19, "u"=>20, "v"=>21, "w"=>22, "x"=>23, "y"=>24, "z"=>25}


def vowel_rotate(str)
  rotated_word = ""
  vowelArr = []
  vowels = ["a", "e" ,"i", "o", "u"]

  str.each_char do |char|
    if vowels.include?(char)
      vowelArr << char
    end
  end

  rotated_vowel = vowelArr.rotate(-1)

  str.each_char.with_index do |char, i|
    if vowels.include?(char)
      str[i] = rotated_vowel.shift
    end
  end
  str
end

class String 

  def select(&prc)
    newStr = ""
    if prc.nil?
        newStr = ""
    else
        self.each_char do |char| 
            newStr += char if prc.call(char)
        end
    end
    newStr
  end

  def map!(&prc)
    self.each_char.with_index do |char, i|
        self[i] = prc.call(char, i)
    end
  end
end

# Examples
#p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
#p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
#p "HELLOworld".select          # => ""

# Examples
#word_1 = "Lovelace"
#word_1.map! do |ch| 
#    if ch == 'e'
#        '3'
#    elsif ch == 'a'
#        '4'
#    else
#        ch
#    end
#end
#p word_1        # => "Lov3l4c3"
#
#word_2 = "Dijkstra"
#word_2.map! do |ch, i|
#    if i.even?
#        ch.upcase
#    else
#        ch.downcase
#    end
#end
#p word_2        # => "DiJkStRa"


def multiply(a, b)
    newNum = 0
    return 0 if a == 0
    if a > 0
      newNum +=  b + multiply(a-1, b)
    else
      newNum +=  -1 * b + multiply(a+1, b)
    end
end
# Examples
#p multiply(3, 5)        # => 15
#p multiply(5, 3)        # => 15
#p multiply(2, 4)        # => 8
#p multiply(0, 10)       # => 0
#p multiply(-3, -6)      # => 18
#p multiply(3, -6)       # => -18
#p multiply(-3, 6)       # => -18

def lucas_sequence(length)
  return [] if length == 0 
  return [2] if length == 1
  return [2,1] if length == 2
  
  sequence = lucas_sequence(length - 1)
  ele = sequence[-1] + sequence[-2]
  sequence << ele
  sequence
end
# Examples
#p lucas_sequence(0)   # => []
#p lucas_sequence(1)   # => [2]    
#p lucas_sequence(2)   # => [2, 1]
#p lucas_sequence(3)   # => [2, 1, 3]
#p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
#p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

def prime_factorization(num)

    (2...num).each do |fact|
        if num % fact == 0
            other_fact = num/fact 
            return [ *prime_factorization(fact), *prime_factorization(other_fact)]
        end
    end
    [num]
    
end


# Examples
p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]