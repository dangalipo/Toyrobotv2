# frozen_string_literal: true

class ReportCommand < Command
  COMMAND_REGEX = /^REPORT$/.freeze

  def execute
    return unless robot.placed?

    puts robot.to_s
  end
end
