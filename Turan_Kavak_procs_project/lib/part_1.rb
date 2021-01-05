def my_map(enumerable, &block)
  result = []
  enumerable.each { |element| result << block.call(element) }
  result
end
def my_select(enumerable, &block)
  result = []
  enumerable.each do |element| 
    if block.call(element) == true 
        result << element
    end
  end 
  result
end
def my_count(enumerable, &block)
  counter = 0
  enumerable.each do |element| 
    if block.call(element) == true 
        counter += 1
    end
  end 
  counter
end
def my_any?(enumerable, &block)
  counter = 0
  enumerable.each do |element| 
    if block.call(element) == true 
        counter += 1
    end
  end 
 if counter > 0
    true
 else
    false
 end
end
def my_all?(enumerable, &block)
  counter = 0
  enumerable.each do |element| 
    if block.call(element) == true 
        counter += 1
    end
  end 
 if counter == enumerable.length
    true
 else
    false
 end
end

def my_none?(enumerable, &block)
  counter = 0
  enumerable.each do |element| 
    if block.call(element) == true 
        counter += 1
    end
  end 
 if counter == 0
    true
 else
    false
 end
end
