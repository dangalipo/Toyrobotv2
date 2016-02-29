class Robot

  attr_accessor :x_position, :y_position, :direction,
    :placed
  attr_reader :coordinates

  def initialize
    self.placed = false
  end

  def placed?
    placed
  end

  def place(coordinates, direction)
    self.coordinates = coordinates
    self.direction = direction
    self.placed = true
  end

 private

 attr_writer :coordinates

end
