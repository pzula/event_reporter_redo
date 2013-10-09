class Queue

  attr_reader :data

  def initialize
    self.clear # just calling self here for clarity that it's a method
  end

  def count
    data.count
  end

  def add(items)
    @data += items
  end

  def clear
    @data = []
  end

  def replace(data)
    clear && add(data)
  end

end