require_relative "dog.rb"
require_relative "cat.rb"
# require 'pry'

class Owner

  @@all = []

  def self.all
    @@all
  end

  def self.count
    self.all.size
  end

  def self.reset_all
    self.all.clear
  end

  attr_reader :name, :species
  
  def initialize(name)
    @name = name
    @species = "human"
    self.save
  end

  def save
    self.class.all << self
  end

  def cats
    Cat.all.find_all{|cat|cat.owner == self}
  end

  def dogs
    Dog.all.find_all{|dog|dog.owner == self}
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_cat(name)
    cat = Cat.new(name, self)
  end

  def buy_dog(name)
    dog = Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each{|dog|dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each{|cat|cat.mood = "happy"}
  end

  def sell_pets
    all = (self.dogs + self.cats)
    all.each{|animal|animal.owner = nil
      animal.mood = "nervous"}
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end

# lauren = Owner.new("Lauren")
# charles = lauren.buy_cat("Charles")
# simbo = lauren.buy_dog("Simbo")
# lauren.sell_pets


