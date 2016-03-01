class Robot

  attr_reader :coordinates, :direction

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

  def turn_to_face(direction)
    self.direction = direction
  end

  def x_position
    return nil if coordinates.nil?
    coordinates.x_coordinate
  end

  def y_position
    return nil if coordinates.nil?
    coordinates.y_coordinate
  end

  def to_s
    return "" unless placed?
    [coordinates.to_s, direction_name].join(',')
  end

  def direction_name
    return "" unless placed?
    direction.name
  end

 private

 attr_accessor :placed
 attr_writer :coordinates, :direction

end
