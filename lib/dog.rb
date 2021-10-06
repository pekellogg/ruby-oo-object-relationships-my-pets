class Dog

  @@all = []

  def self.all
    @@all
  end

  attr_accessor :owner, :mood
  attr_reader :name

  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    self.save
  end

  def save
    self.class.all << self
  end
  
end

