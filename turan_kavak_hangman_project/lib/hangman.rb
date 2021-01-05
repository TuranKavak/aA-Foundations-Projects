class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end
#-----------
  def initialize
   @secret_word = Hangman.random_word
   length = @secret_word.length
   @guess_word = Array.new(length, "_") 
   @attempted_chars = []
   @remaining_incorrect_guesses = 5
  end
#-----------
  def guess_word
    @guess_word
  end
#-----------
  def attempted_chars
    @attempted_chars
  end
#-----------
  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end
#-----------
  def already_attempted?(char)
    if @attempted_chars.include?(char)
     true 
    else 
     false
    end
  end
#-----------
  def get_matching_indices(char)
    newArr = []
    @secret_word.each_char.with_index { |char1, idx| newArr << idx if char == char1 }
    newArr
  end
#-----------
  def fill_indices(char, array)#"o", [1,3]
    #@guess_word = ["_", "_", "_", "_"]
    array.each { |num| @guess_word[num] = char }
  end
#-----------
  def try_guess(char)
    
    if self.already_attempted?(char) == true
      p 'that has already been attempted'
      return false
    end

    array = self.get_matching_indices(char)
    self.fill_indices(char, array)
    @attempted_chars << char

    @remaining_incorrect_guesses -= 1 if array.empty?
    true
  end
#-----------
  def ask_user_for_guess
    p "Enter a char:"
    char = gets.chomp
    return try_guess(char)
  end
#-----------
  def win?
    if @guess_word.join("") == @secret_word
      p 'WIN'
      true
    else
      false
    end
  end
#-----------
  def lose?
    if @remaining_incorrect_guesses == 0
      p 'LOSE'
      true
    else
      false
    end
  end
#-----------
  def game_over?
    if self.win? == true || self.lose? == true
      p @secret_word
      true
    else
      false
    end
  end

end
