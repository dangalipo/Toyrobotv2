class Robot

  attr_accessor :direction
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

  def move(coordinates)
    if placed?
      self.coordinates = coordinates
    end
  end

  def x_position
    return nil if coordinates.nil?
    coordinates.x_coordinate
  end

  def y_position
    return nil if coordinates.nil?
    coordinates.y_coordinate
  end

  def direction_name
    return nil if direction.nil?
    direction.name
  end

 private

 attr_accessor :placed
 attr_writer :coordinates

end
