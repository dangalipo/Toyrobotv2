class TurnCommand < Command

  COMMAND_REGEX = /^(LEFT|RIGHT)$/

  def initialize(unparsed_command)
    self.turn_direction = unparsed_command.match(COMMAND_REGEX)[1]
  end

  def execute(robot, world)
    return unless robot.placed?
    new_direction = if turn_direction == "LEFT"
      world.direction_left_of_direction(robot.direction)
    else
      world.direction_right_of_direction(robot.direction)
    end
    robot.turn_to_face(new_direction)
  end

private

  attr_accessor :turn_direction
end
