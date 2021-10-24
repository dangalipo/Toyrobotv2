class MoveCommand < Command
  COMMAND_REGEX = /^MOVE$/

  def initialize(robot, _unparsed_command)
    super(robot)
  end

  def execute(table_top)
    return nil unless robot.placed?

    direction = robot.direction
    new_x_position = robot.x_position + direction.move_x
    new_y_position = robot.y_position + direction.move_y
    coordinates = Coordinates.new(x_coordinate: new_x_position,
                                  y_coordinate: new_y_position)
    robot.move(coordinates) if table_top.valid_coordinates?(coordinates)
  end
end
