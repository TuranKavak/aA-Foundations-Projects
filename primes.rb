# primes.rb

require 'byebug'

def prime?(num)
   # debugger # drops us into the debugger right after this point

  (2...num).each do |idx|
    if num % idx == 0
      return false
    end
  end
  true
end

def primes(num_primes)
    
    #debugger
  ps = []
  num = 3
  while ps.count < num_primes
    ps << num if prime?(num)
  end
end

if __FILE__ == $PROGRAM_NAME
  puts primes(100)
end
