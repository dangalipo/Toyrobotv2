class ReportCommand < Command
  COMMAND_REGEX = /^REPORT$/

  def initialize(robot, _unparsed_command)
    super(robot)
  end

  def execute(_table_top)
    return unless robot.placed?
    puts robot.to_s
  end

end
