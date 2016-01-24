class TurnCommand

  COMMAND_REGEX = /^(LEFT|RIGHT)$/

  def initialize(unparsed_command)
    self.turn_direction = unparsed_command.match(COMMAND_REGEX)[1]
  end

  def execute(robot)
    return unless robot.placed?
    if turn_direction == "LEFT"
      robot.direction = (robot.direction - 1) % World::DIRECTIONS.size
    else
      robot.direction = (robot.direction + 1) % World::DIRECTIONS.size
    end
  end

private

  attr_accessor :turn_direction
end
