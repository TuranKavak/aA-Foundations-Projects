def reverser(string, &block)
    newString = string.reverse
    block.call(newString)
end

def word_changer(string, &block)
    newString = string.split(" ")
    newString = newString.map { |ele| block.call(ele) }
    return newString.join(" ")
end

def greater_proc_value(num1, proc_1, proc_2)
    if proc_1.call(num1) > proc_2.call(num1)
        proc_1.call(num1)
    else
        proc_2.call(num1)
    end
    
end

def and_selector(array, proc_1, proc_2)
    array.select { |ele| proc_1.call(ele) == true &&proc_2.call(ele) == true }
end

def alternating_mapper(array, proc_1, proc_2)
    i = 0
    while i < array.length
        if i % 2 == 0
            array[i] = proc_1.call(array[i])
        else
            array[i] = proc_2.call(array[i])
        end
        i += 1
    end
    array
end
