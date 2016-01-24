class PlaceCommand
  COMMAND_REGEX = /^PLACE ([0-4]),([0,4]),(#{World::DIRECTIONS.join("|")})$/

  def initialize(unparsed_command)
    parsed_command = unparsed_command.match(COMMAND_REGEX)
    self.x_position = parsed_command[1].to_i
    self.y_position = parsed_command[2].to_i
    self.direction = World::DIRECTIONS.index(parsed_command[3])
  end

  def execute(robot)
    robot.x_position = x_position
    robot.y_position = y_position
    robot.direction = direction
    robot.placed = true
  end

private

  attr_accessor :x_position, :y_position, :direction

end
