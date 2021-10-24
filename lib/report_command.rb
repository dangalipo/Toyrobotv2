class ReportCommand < Command
  COMMAND_REGEX = /^REPORT$/

  def execute
    return unless robot.placed?

    puts robot.to_s
  end
end
