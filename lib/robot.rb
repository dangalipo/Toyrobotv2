class Robot
  attr_reader :coordinates, :direction

  def initialize
    self.placed = false
    self.coordinates = Coordinates.new(x_coordinate: nil,
                                       y_coordinate: nil)
    self.direction = Direction.new(name: '', move_x: 0, move_y: 0)
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
    self.coordinates = coordinates if placed?
  end

  def turn_to_face(direction)
    self.direction = direction
  end

  def x_position
    coordinates.x_coordinate
  end

  def y_position
    coordinates.y_coordinate
  end

  def to_s
    return '' unless placed?

    [coordinates.to_s, direction_name].join(',')
  end

  def direction_name
    direction.name
  end

  private

  attr_accessor :placed
  attr_writer :coordinates, :direction
end
