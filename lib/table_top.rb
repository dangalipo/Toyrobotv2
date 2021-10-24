class TableTop
  DEFAULT_DIRECTIONS = [
    Direction.new(name: 'NORTH', move_x: 0, move_y: 1),
    Direction.new(name: 'EAST', move_x: 1, move_y: 0),
    Direction.new(name: 'SOUTH', move_x: 0, move_y: -1),
    Direction.new(name: 'WEST', move_x: -1, move_y: 0)
  ]

  def initialize(x_size: 5, y_size: 5, directions: DEFAULT_DIRECTIONS)
    self.x_plane = (0..x_size)
    self.y_plane = (0..y_size)
    self.directions = directions
  end

  def find_direction_by_name(name)
    directions.find { |direction| direction.name == name }
  end

  def valid_coordinates?(coordinates)
    on_x_plane?(coordinates.x_coordinate) &&
      on_y_plane?(coordinates.y_coordinate)
  end

  def direction_left_of_direction(direction)
    next_direction(directions.index(direction), -1)
  end

  def direction_right_of_direction(direction)
    next_direction(directions.index(direction), 1)
  end

  private

  def on_x_plane?(position)
    x_plane.include?(position)
  end

  def on_y_plane?(position)
    y_plane.include?(position)
  end

  def next_direction(index, modifier)
    new_index = (index + modifier) % directions.size
    directions[new_index]
  end

  attr_accessor :x_plane, :y_plane, :directions
end
