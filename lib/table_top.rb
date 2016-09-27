class TableTop
  def initialize
    self.x_plane = (0..4)
    self.y_plane = (0..4)
    self.directions = [
      Direction.new(name: 'NORTH', move_x: 0, move_y: 1),
      Direction.new(name: 'EAST', move_x: -1, move_y: 0),
      Direction.new(name: 'SOUTH', move_x: 0, move_y: -1),
      Direction.new(name: 'WEST', move_x: 1, move_y: 0),
    ]
  end

  def find_direction_by_name(name)
    directions.find{|direction| direction.name == name }
  end

  def on_x_plane?(position)
    x_plane.include?(position)
  end

  def on_y_plane?(position)
    y_plane.include?(position)
  end

  def direction_left_of_direction(direction)
    next_direction(directions.index(direction), -1)
  end

  def direction_right_of_direction(direction)
    next_direction(directions.index(direction), 1)
  end

  private

  def next_direction(index, modifier)
    new_index = (index + modifier) % directions.size
    directions[new_index]
  end

  attr_accessor :x_plane, :y_plane, :directions
end
