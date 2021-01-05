def my_reject(array, &prc)
    newArr = []
    array.each do |i|
        if !prc.call(i)
            newArr << i
        end
    end
    newArr
end

def my_one?(array, &prc)
    newArr = []
    array.each do |i|
        if prc.call(i)
            newArr << i
        end
    end
    return true if newArr.length == 1
    return false
end

def hash_select(hash_val, &prc)
    newHash = {}
    hash_val.each do |k, v|
        newHash[k] = v if prc.call(k, v)
    end
    newHash
end

def xor_select (arr, prc_1, prc_2)
    arr.select do |el|
        (prc_1.call(el) || prc_2.call(el)) && !(prc_1.call(el) && prc_2.call(el))
    end
end

def proc_count(val, arr)
    counter = 0
    arr.each do |prc|
        counter += 1 if prc.call(val)
    end
    counter
end
