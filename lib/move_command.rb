class MoveCommand < Command
  COMMAND_REGEX = /^MOVE$/

  def initialize(unparsed_command)
    # defined to keep consitency with other
    # command classes
  end

  def execute(robot, world)
    return nil unless robot.placed?
    new_x_position = robot.x_position + world.x_move_for_direction(robot.direction)
    new_y_position = robot.y_position + world.y_move_for_direction(robot.direction)
    if world.on_x_plane?(new_x_position) && world.on_x_plane?(new_y_position)
      coordinates = Coordinates.new(x_coordinate: new_x_position,
                                    y_coordinate: new_y_position)
      robot.move(coordinates)
    end
  end

end
