class CommandFactory
  def initialize(robot:, unparsed_command:)
    self.unparsed_command = unparsed_command
    self.robot = robot
  end

  def command
    command_class =
      case unparsed_command
      when PlaceCommand::COMMAND_REGEX then PlaceCommand
      when TurnCommand::COMMAND_REGEX then TurnCommand
      when MoveCommand::COMMAND_REGEX then MoveCommand
      when ReportCommand::COMMAND_REGEX then ReportCommand
      else
        UnknownCommand
      end
    command_class.new(robot, unparsed_command)
  end

  private

  attr_accessor :unparsed_command, :robot, :commands
end
