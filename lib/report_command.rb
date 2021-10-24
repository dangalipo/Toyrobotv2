class ReportCommand < Command
  COMMAND_REGEX = /^REPORT$/


  def execute(_table_top)
    return unless robot.placed?

    puts robot.to_s
  end
end
