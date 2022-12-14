# Hide complex logic related to iteration and provide methods for easy access

class ArrayIterator
  def initialize(array)
    @array = array
    @index = 0
  end

  def set_index(index)
    @index = index
  end

  def has_next?
    @index < @array.length
  end

  def item
    @array[@index]
  end

  def next_item
    value = @array[@index]
    @index += 1
    value
  end
end

iterator =ArrayIterator.new([1, 2, 3])
iterator.set_index(1)
puts iterator.next_item
