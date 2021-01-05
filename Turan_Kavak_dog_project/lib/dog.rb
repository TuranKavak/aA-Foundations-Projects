class Dog
 def initialize(name, breed, age, bark, favorite_foods)
    @name = name
    @breed = breed
    @age = age
    @bark = bark
    @favorite_foods = favorite_foods
 end
  def name
    @name
  end
  def breed
    @breed
  end
  def bark
    @bark
  end
  def age
    @age
  end
  def favorite_foods
    @favorite_foods
  end
  ######
  def name=(string)
    @name = string
  end
  def breed=(string)
    @breed = string
  end

  def bark
    if @age > 3
    @bark.upcase
    else
    @bark.downcase
    end
  end

  def age=(number)
    @age = number
  end

  def favorite_food?(string)
    string = string.capitalize
    if @favorite_foods.include?(string)
        true
    else
        false
    end
  end




  #def self.whos_louder(dog_1, dog_2)
  #  if dog_1.bark.length > dog_2.bark.length
  #    return dog_1.name
  #  elsif dog_1.bark.length < dog_2.bark.length
  #    return dog_2.name
  #  else
  #    return nil
  #  end
  #end

  
end
