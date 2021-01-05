def average(num_1, num_2)
(num_1 + num_2)/2.0
end

def average_array(array)
 array.inject{ |sum, el| sum + el }.to_f / array.size 
end

def repeat(string, number)
z = ""
    number.times do
     z+=string
    end
return z
end

def yell(string)
string.upcase + "!"
end

def alternating_case(string)
 str = string.split(" ")
i = 0
 while i < str.length
  str[i] = str[i].upcase 
  i += 1
  str[i] = str[i].downcase
  i += 1
 end
return str.join(" ")
end

