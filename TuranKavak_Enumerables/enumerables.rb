class Array
  def my_each(&prc)
    self.length.times do |i|
      prc.call(self[i])
    end
    self
  end

  def my_select(&prc)
    selected = []
    self.my_each do |num|
      selected << num if prc.call(num) 
    end
    selected
  end
  def my_reject(&prc)
    selected = []
    self.my_each do |num|
      selected << num if !prc.call(num) 
    end
    selected
  end
  def my_any?(&prc)
    counter = 0
    self.my_each do |num|
      counter += 1 if prc.call(num) 
    end
    return true if counter > 0
    false
  end
  def my_all?(&prc)
    self.my_each do |num|
      return false unless prc.call(num) 
    end
    true
  end
  def my_flatten(&prc)
    flattened = []
    self.each do |el|
       if el.is_a?(Array)
        flattened += el.my_flatten
       else
        flattened << el
       end
    end
    flattened
  end
  def my_zip(*arrays)
    zipped = []

    self.length.times do |i|
      
      subzip = [self[i]]

      arrays.each do |array|
        subzip << array[i]
      end

      zipped << subzip
    end

    zipped
  end
  def my_rotate(num= 1)
    rotated = []

    self.each.with_index do |ele, idx|
        rotated << self[(idx+num) % self.length]
    end

    rotated
  end

  def my_join(string = "")
    string_new = ""
    self.each do |ele|
      string_new += ele
      string_new += string
    end
    string_new
  end
  def my_reverse
    newArr = []
    self.length.times do
      newArr << self.pop
    end
    newArr
  end
  
end
#p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
#p [ 1 ].my_reverse               #=> [1]
#a = [ "a", "b", "c", "d" ]
#p a.my_join         # => "abcd"
#p a.my_join("$")    # => "a$b$c$d"
#a = [ "a", "b", "c", "d" ]
#p a.my_rotate         #=> ["b", "c", "d", "a"]
#p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
#p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
#p a.my_rotate(15)     #=> ["d", "a", "b", "c"]
#a = [ 4, 5, 6 ]
#b = [ 7, 8, 9 ]
#p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
#p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
#p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]
#c = [10, 11, 12]
#d = [13, 14, 15]
#p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]
# calls my_each twice on the array, printing all the numbers twice.
#return_value = [1, 2, 3].my_each do |num|
#  puts num
#end.my_each do |num|
#  puts num
#end
### => 1
##     2
##     3
##     1
##     2
##     3
#
#p return_value  # => [1, 2, 3]

#a = [1, 2, 3]
#p a.my_select { |num| num > 1 } # => [2, 3]
#p a.my_select { |num| num == 4 } # => []

#a = [1, 2, 3]
#p a.my_reject { |num| num > 1 } # => [1]
#p a.my_reject { |num| num == 4 } # => [1, 2, 3]

#a = [1, 2, 3]
#p a.my_any? { |num| num > 1 } # => true
#p a.my_any? { |num| num == 4 } # => false
#p a.my_all? { |num| num > 1 } # => false
#p a.my_all? { |num| num < 4 } # => true

#p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
