class Code
  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  def self.valid_pegs?(chars)
    chars.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase) }
  end

  def self.random(length)
    rand_arr = []
    length.times { rand_arr << POSSIBLE_PEGS.keys.sample }
    Code.new(rand_arr)
  end
  def self.from_string(pegs_string)
    Code.new(pegs_string.split(""))
  end 
############

  def initialize(chars)
    if Code.valid_pegs?(chars)
      @pegs = chars.map(&:upcase)
    else
      raise "error"
    end
  end
  def [](index)
    @pegs[index]
  end
  def length
    @pegs.length
  end
  def num_exact_matches(guess)
    counter = 0

    @pegs.each.with_index do |char, idx|
      counter += 1 if @pegs[idx] == guess[idx]
    end

    counter
  end

  def num_near_matches(guess)
    counter = 0

    @pegs.each.with_index do |char, idx|
      if @pegs[idx] != guess[idx] && @pegs.include?(guess[idx])
        counter += 1
      end
    end

    counter
  end

  def ==(guess)
    self.pegs == guess.pegs
  end
end
