require "pry" 

class Owner
  # code goes here
  attr_accessor :name, :pets
  attr_reader :species
  @@all = []

  def initialize(species)
    @species = species
    @@all << self
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def self.all
    @@all
  end
  
  def self.count
    @@all.size
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    pets[:fishes] << fish
  end
   
  
  def buy_dog(name)
    dog = Dog.new(name)
    pets[:dogs] << dog
  end

  def buy_cat(name)
    cat = Cat.new(name)
    pets[:cats] << cat
  end
  
  def walk_dogs
    pets[:dogs].map do |dog| 
      dog.mood = "happy"
    end
  end

  def play_with_cats
    pets[:cats].map do |cat| 
      cat.mood = "happy"
    end
  end

  def feed_fish
    pets[:fishes].map do |fish| 
      fish.mood = "happy"
    end
  end

  def sell_pets
    self.pets.each do |kind, pet|
      pet.map {|pet| pet.mood = "nervous"}
    end
    self.pets.clear
  end

  def list_pets
    "I have #{self.pets[:fishes].length} fish, #{self.pets[:dogs].length} dog(s), and #{self.pets[:cats].length} cat(s)."
  end

  # owner = Owner.new("humans")
  # owner.buy_fish("fish")
  # owner.buy_dog("dog")
  # binding.pry
end