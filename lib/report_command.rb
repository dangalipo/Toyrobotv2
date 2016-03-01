class ReportCommand < Command
  COMMAND_REGEX = /^REPORT$/

  def initialize(unparsed_command)
    # defined to keep consitency with other
    # command classes
  end

  def execute(robot, world)
    return unless robot.placed?
    puts robot.to_s
  end

end
