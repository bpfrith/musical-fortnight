class Taglines

  attr_accessor :colour

  def initialize
    @colour = options['colour']
  end

  def self.all()
    return ["Bringing music to life", 
            "Roses are red, violets are blue, when I listen to Trivium, my neighbours do too", 
            "Retro Reproduction", 
            "More than bit perfect"]
  end

  def self.colour()
    @colour = "%06x" % (rand * 0xffffff)
  end

end