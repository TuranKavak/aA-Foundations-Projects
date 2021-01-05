def all_words_capitalized?(array)
    array.all? { |word| word==word.capitalize } 
end

def no_valid_url?(array)
    #urls = ['.com', '.net', '.io', '.org']
    array.none? { |word| word.include?('.com')} #|| '.net', '.io', '.org'
end

def any_passing_students?(array)
    array.any? { |student| student[:grades].sum/student[:grades].length >= 75 }
end
