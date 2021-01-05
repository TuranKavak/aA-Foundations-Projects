# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array

  def span
    return self.max - self.min if self.length>0
  end
#---------
  def average
    return self.sum / self.length.to_f if self.length>0
  end
#---------
  def median
    self_new = self.sort
    if self.length > 0
        return self_new[(self.length/2)] if self.length % 2 == 1
        return (self_new[(self.length/2)-1] + self_new[(self.length/2)].to_f) / 2 if self.length % 2 == 0
    end
  end
#---------
  def counts 
    counter = Hash.new(0)
    self.each { |ele| counter[ele] += 1}
    return counter
  end
#---------
  def my_count(arg) 
    counter = 0
    self.each { |ele| counter += 1 if ele == arg}
    counter
  end
#---------
  def my_index(arg)
    counter = 0
    self.each do |ele| 
        if ele == arg
            return counter
        end
        counter += 1
    end
    nil
  end
#---------
    def my_uniq
        newArr = []
        self.each { |ele| newArr << ele if !newArr.include?(ele) }
        newArr
    end
#---------

    def my_transpose

    new_matrix = []
    i = 0
    while i < self.length
    new_matrix[i] = []
    j = 0 
        while j < self.length
        new_matrix[i] << self[j][i]
        j += 1
        end
    i += 1
    end
    new_matrix
    end


end


