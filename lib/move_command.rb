class MoveCommand
  MOVEMENTS = [[0,1], [-1,0],[0,-1], [1,0]].freeze
  COMMAND_REGEX = /^MOVE$/

  def initialize(unparsed_command)
    # defined to keep consitency with other
    # command classes
  end

  def execute(robot)
    return unless robot.placed?
    robot.x_position += MOVEMENTS[robot.direction][0] if valid_x_move_for?(robot)
    robot.y_position += MOVEMENTS[robot.direction][1] if valid_y_move_for?(robot)
  end

private

  def valid_x_move_for?(robot)
    (0..4).include?(robot.x_position + MOVEMENTS[robot.direction][0])
  end

  def valid_y_move_for?(robot)
    (0..4).include?(robot.y_position + MOVEMENTS[robot.direction][1])
  end
end
