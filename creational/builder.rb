# Build model object with builder pattern and separate methods

class Computer
  attr_accessor :processor, :motherboard, :display
end

class ComputerBuilder
  def initialize
    @computer = Computer.new
  end

  def set_processor(processor)
    @computer.processor = processor
  end

  def set_motherboard(motherboard)
    @computer.motherboard = motherboard
  end

  def set_display(display)
    @computer.display = display
  end

  def computer
    @computer
  end

  def self.build
    builder = new
    yield(builder)
    builder.computer

    puts builder.computer.inspect
  end
end

ComputerBuilder.build do |builder|
  builder.set_processor("Intel")
  builder.set_motherboard("Asus Prime")
  builder.set_display("Acer")
end
