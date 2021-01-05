def strange_sums(arr)
  counter = 0
  arr.each.with_index do |num1, idx1|
      arr.each.with_index do |num2, idx2|
        if num1 + num2 == 0 && idx1 < idx2
          counter += 1
        end
      end
  end
  counter
end

#p strange_sums([2, -3, 3, 4, -2])     # 2
#p strange_sums([42, 3, -1, -42])      # 1
#p strange_sums([-5, 5])               # 1
#p strange_sums([19, 6, -3, -20])      # 0
#p strange_sums([9])                   # 0
##########
def pair_product(arr, num)
  arr.each.with_index do |num1, idx1|
    arr.each.with_index do |num2, idx2|
      return true if num1 * num2 == num && idx1 < idx2
    end
  end
  false
end
#p pair_product([4, 2, 5, 8], 16)    # true
#p pair_product([8, 1, 9, 3], 8)     # true
#p pair_product([3, 4], 12)          # true
#p pair_product([3, 4, 6, 2, 5], 12) # true
#p pair_product([4, 2, 5, 7], 16)    # false
#p pair_product([8, 4, 9, 3], 8)     # false
#p pair_product([3], 12)      
##########

def rampant_repeats(str, hash)
  newStr = []
  str.split("").each do |letter|
    if hash.keys.include?(letter)
      hash[letter].times do 
        newStr << letter
      end
    else
      newStr << letter
    end
  end
  newStr.join("")
end

#p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
#p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
#p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
#p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'


def perfect_square?(num)
  (1..num).each do |tester|
    if tester * tester == num
      return true
    end
  end
  false

end

#p perfect_square?(1)     # true
#p perfect_square?(4)     # true
#p perfect_square?(64)    # true
#p perfect_square?(100)   # true
#p perfect_square?(169)   # true
#p perfect_square?(2)     # false
#p perfect_square?(40)    # false
#p perfect_square?(32)    # false
#p perfect_square?(50)    # false

def anti_prime?(number)
  previous_divisors = 0 
  current_divisors = 0 
  max_number = 1 
  (1..number).each do |num|
    current_divisors = factors_of_amount(num)
    if current_divisors > previous_divisors
      max_number = num
      previous_divisors = current_divisors
    end
  end
  return true if max_number == number
  false
end
def factors_of_amount(num)
    (1..num).collect { |n| [n, num/n] if ((num/n) * n) == num}.compact.count
end
#p anti_prime?(24)   # true
#p anti_prime?(36)   # true
#p anti_prime?(48)   # true
#p anti_prime?(360)  # true
#p anti_prime?(1260) # true
#p anti_prime?(27)   # false
#p anti_prime?(5)    # false
#p anti_prime?(100)  # false
#p anti_prime?(136)  # false
#p anti_prime?(1024) # false


def matrix_addition(matrix_1, matrix_2)
  newMatrix = Array.new(matrix_1.length) { Array.new(matrix_1.first.length) }
   (0...matrix_1.length).each do |outer|
    (0...matrix_1.first.length).each do |inner|
      newMatrix[outer][inner] = matrix_1[outer][inner] + matrix_2[outer][inner]
    end
  end
  newMatrix
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

#p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
#p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
#p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
#p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

def mutual_factors(*numbers)
  divisors = []
  (1..numbers.max).each do |num|
    if numbers.all? { |number| number % num == 0 }
      divisors << num
    end
  end
  divisors
end

#p mutual_factors(50, 30)            # [1, 2, 5, 10]
#p mutual_factors(50, 30, 45, 105)   # [1, 5]
#p mutual_factors(8, 4)              # [1, 2, 4]
#p mutual_factors(8, 4, 10)          # [1, 2]
#p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
#p mutual_factors(12, 24, 64)        # [1, 2, 4]
#p mutual_factors(22, 44)            # [1, 2, 11, 22]
#p mutual_factors(22, 44, 11)        # [1, 11]
#p mutual_factors(7)                 # [1, 7]
#p mutual_factors(7, 9)              # [1]

def tribonacci_number(n)
  return 1 if n <= 2
  return 2 if n <= 3    
  tribonacci_number( n - 1 ) + tribonacci_number( n - 2 ) + tribonacci_number( n - 3 )
end

#p tribonacci_number(1)  # 1
#p tribonacci_number(2)  # 1
#p tribonacci_number(3)  # 2
#p tribonacci_number(4)  # 4
#p tribonacci_number(5)  # 7
#p tribonacci_number(6)  # 13
#p tribonacci_number(7)  # 24
#p tribonacci_number(11) # 274

def matrix_addition_reloaded(*matrices)
  return nil if matrices.any? { |matrix| matrix.length != matrices.first.length} 
  newArray = Array.new(matrices.first.length) { Array.new(matrices.first.first.length, 0) } #correct
  matrices.each do |matrix| #correct
    (0...matrix.length).each do |idx|
      (0...matix.first.length).each do |idx2|
          newArray[idx][idx2] += matrix[idx][idx2]
      end
    end
  end
  newArray
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

#p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
#p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
#p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
#p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
#p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
#p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil


def squarocol?(array)
  array.any? {|row| row.uniq.size == 1 } || array.transpose.any? {|row| row.uniq.size == 1 }
end


#p squarocol?([
#    [:a, :x , :d],
#    [:b, :x , :e],
#    [:c, :x , :f],
#]) # true
#
#p squarocol?([
#    [:x, :y, :x],
#    [:x, :z, :x],
#    [:o, :o, :o],
#]) # true
#
#p squarocol?([
#    [:o, :x , :o],
#    [:x, :o , :x],
#    [:o, :x , :o],
#]) # false
#
#p squarocol?([
#    [1, 2, 2, 7],
#    [1, 6, 6, 7],
#    [0, 5, 2, 7],
#    [4, 2, 9, 7],
#]) # true
#
#p squarocol?([
#    [1, 2, 2, 7],
#    [1, 6, 6, 0],
#    [0, 5, 2, 7],
#    [4, 2, 9, 7],
#]) # false
#p squarocol?([
#    [2, 2, 2, 2],
#    [1, 6, 6, 0],
#    [0, 5, 2, 7],
#    [4, 2, 9, 7],
#]) # true

require 'matrix'

def squaragonal?(matrix)
  majordiagonal(matrix) || minordiagonal(matrix)
end

def majordiagonal(matrix)
  (Matrix.rows(matrix.transpose).each(:diagonal).to_a).uniq.size == 1
end
def minordiagonal(matrix)
  n = matrix.first.length
  newMat = (0...n).map do |i|
    matrix[i][i], matrix[i][n-i-1] = matrix[i][n-i-1], matrix[i][i]
  end
  newMat1 = newMat.map do |arr|
    arr.first
  end
  newMat1.uniq.size == 1
end
#p squaragonal?([
#    [:x, :y, :o],
#    [:x, :x, :x],
#    [:o, :o, :x],
#]) # true
#
#p squaragonal?([
#    [:x, :y, :o],
#    [:x, :o, :x],
#    [:o, :o, :x],
#]) # true
#
#p squaragonal?([
#   [1, 2, 2, 7],
#    [1, 1, 6, 7],
#    [0, 5, 1, 7],
#    [4, 2, 9, 1],
#]) # true
#p squaragonal?([
#    [1, 2, 2, 5],
#    [1, 6, 5, 0],
#    [0, 2, 2, 7],
#    [5, 2, 9, 7],
#]) # false

def pascal_calc(row_num)
  if row_num == 0
    return [1]
  end
  
  p previous = pascal_calc(row_num - 1)
  
  ret = []
  
  (previous.length - 1).times do |i|
    ret.push (previous[i] + previous[i + 1])
  end
  
  return [1, ret, 1].flatten
end

def pascals_triangle(row_num)
  pascal_calc(row_num - 1)
end


#p pascals_triangle(5)
## [
##     [1],
##     [1, 1],
##     [1, 2, 1],
##     [1, 3, 3, 1],
##     [1, 4, 6, 4, 1]
## ]
#
#p pascals_triangle(7)
## [
##     [1],
##     [1, 1],
##     [1, 2, 1],
##     [1, 3, 3, 1],
##     [1, 4, 6, 4, 1],
##     [1, 5, 10, 10, 5, 1],
##     [1, 6, 15, 20, 15, 6, 1]
## ]

require 'prime'
def mersenne_prime(number)
  counter = 0
  x = 0
  while counter < number 
      x += 1
      candidate = 2**x - 1
      if Prime.prime?(candidate) 
      counter += 1
      end
  end
  candidate
end

#p mersenne_prime(1) # 3
#p mersenne_prime(2) # 7
#p mersenne_prime(3) # 31
#p mersenne_prime(4) # 127
#p mersenne_prime(6) # 131071
#


def triangular_word?(word)
  alphabet = ("a".."z").to_a
  sum = 0
  word.each_char do |char|
    sum += (alphabet.index(char) + 1) 
  end
  (1..sum).each do |i|
    return true if ((i * (i + 1)) / 2) == sum
  end
  false
end


#p triangular_word?('abc')       # true
#p triangular_word?('ba')        # true
#p triangular_word?('lovely')    # true
#p triangular_word?('question')  # true
#p triangular_word?('aa')        # false
#p triangular_word?('cd')        # false
#p triangular_word?('cat')       # false
#p triangular_word?('sink')      # false

def consecutive_collapse(array)
  array.each{  array = collapse(array) }
  array
end
def collapse(nums)
  (0...nums.length-1).each do |i|
    if nums[i] + 1 == nums[i + 1] || nums[i] == nums[i + 1] + 1
      return nums[0...i] + nums[i+2..-1]
    end
  end
  nums
end
      

#p consecutive_collapse([3, 4, 1])                     # [1]
#p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
#p consecutive_collapse([9, 8, 2])                     # [2]
#p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
#p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
#p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
#p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
#p consecutive_collapse([13, 11, 12, 12])              # []
require 'prime'
def replace(ele, num)
  newNum = 0
  counter = 0
  if num > 0
    while counter < num
      ele += 1
      if Prime.prime?(ele) 
        counter += 1
      end
    end
  elsif num < 0
    while counter > num
      ele -= 1
      if ele < 2
        return nil
      end
      if Prime.prime?(ele) 
        counter -= 1
      end
    end
  else
    ele = nil
  end
  ele
end
def pretentious_primes(array, n)
  array.map { |num| replace(num, n) }
end
#p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
#p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
#p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
#p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
#p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
#p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
#p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
#p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
#p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
#p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]