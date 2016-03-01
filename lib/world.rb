require "singleton"
require "forwardable"
class World
  def initialize
    self.x_plane = (0..4)
    self.y_plane = (0..4)
    self.directions = [
      Direction.new(name: "NORTH", move_x: 0, move_y: 1),
      Direction.new(name: "EAST", move_x: -1, move_y: 0),
      Direction.new(name: "SOUTH", move_x: 0, move_y: -1),
      Direction.new(name: "WEST", move_x: 1, move_y: 0),
    ]
  end

  def direction_names
    directions.map{|direction| direction.name }
  end

  def x_move_for_direction(direction)
    directions[direction].move_x
  end

  def y_move_for_direction(direction)
    directions[direction].move_y
  end

  def on_x_plane?(position)
    x_plane.include?(position)
  end

  def on_y_plane?(position)
    y_plane.include?(position)
  end

  def direction_left_of_direction(direction)
    (direction - 1) % directions.size
  end

  def direction_right_of_direction(direction)
    (direction + 1) % directions.size
  end

  private

  attr_accessor :x_plane, :y_plane, :directions
end
