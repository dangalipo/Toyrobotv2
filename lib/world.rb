require "singleton"
require "forwardable"
class World
  include Singleton

  attr_accessor :x_plane, :y_plane, :directions

  def initialize
    self.x_plane = (0..4)
    self.y_plane = (0..4)
    self.directions = [
      { name: "NORTH", move_x: 0, move_y: 1 },
      { name: "EAST", move_x: -1, move_y: 0 },
      { name: "SOUTH", move_x: 0, move_y: -1 },
      { name: "WEST", move_x: 1, move_y: 0 },
    ]
  end

  class << self
    extend Forwardable
    def_delegators :instance, :direction_names, :x_move_for_direction,
      :y_move_for_direction, :on_x_plane?, :on_y_plane?,
      :direction_left_of_direction, :direction_right_of_direction
  end

  def direction_names
    directions.map{|direction| direction[:name]}
  end

  def x_move_for_direction(direction)
    directions[direction][:move_x]
  end

  def y_move_for_direction(direction)
    directions[direction][:move_y]
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

end
