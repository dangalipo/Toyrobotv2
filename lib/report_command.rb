class ReportCommand
  COMMAND_REGEX = /^REPORT$/

  def initialize(unparsed_command)
    # defined to keep consitency with other
    # command classes
  end

  def execute(robot)
    return unless robot.placed?
    puts "#{robot.x_position},#{robot.y_position},#{World::DIRECTIONS[robot.direction]}"
  end

end
