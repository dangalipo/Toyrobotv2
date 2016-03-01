class TurnCommand < Command

  COMMAND_REGEX = /^(LEFT|RIGHT)$/

  def initialize(unparsed_command)
    self.turn_direction = unparsed_command.match(COMMAND_REGEX)[1]
  end

  def execute(robot, world)
    return unless robot.placed?
    if turn_direction == "LEFT"
      robot.direction = world.direction_left_of_direction(robot.direction)
    else
      robot.direction = world.direction_right_of_direction(robot.direction)
    end
  end

private

  attr_accessor :turn_direction
end
