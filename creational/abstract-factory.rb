# lets you produce families of related objects without specifying their concrete classes.

class Chair
end

class Table
end

class ModernChair < Chair
  def leg_count = 3
  def cushion? = false
end

class VintageChair < Chair
  def leg_count = 4
  def cushion? = true
  def no_of_cushion = 1
end

class ModernTable < Table
  def material = "glass"
end

class VintageTable < Table
  def material = "wood"
end

class FurnitureFactory
end

class ModernFurnitureFactory < FurnitureFactory
  def create_chair = ModernChair.new
  def create_table = ModernTable.new
end

class VintageFurnitureFactory < FurnitureFactory
  def create_chair = VintageChair.new
  def create_table = VintageTable.new
end

def client_code(factory)
  chair = factory.create_chair
  table = factory.create_table
end

class Myapp
  def self.call(factory:)
    table = factory.create_table
    chair = factory.create_chair
    
    puts "Chair has #{chair.leg_count} legs and #{chair.cushion? ? chair.no_of_cushion : ' no '} cushion."
    puts "Table is made of #{table.material}."
    puts "************** *****************"
  end
end

modern_factory = ModernFurnitureFactory.new
vintage_factory = VintageFurnitureFactory.new

Myapp.call(factory: modern_factory)
Myapp.call(factory: vintage_factory)
