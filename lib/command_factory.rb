class CommandFactory
  DEFAULT_COMMANDS = [PlaceCommand, TurnCommand, MoveCommand, ReportCommand]
  def initialize(robot:, unparsed_command:, commands: DEFAULT_COMMANDS)
    self.unparsed_command = unparsed_command
    self.robot = robot
    self.commands = commands
  end

  def command
    command_class = commands.find do |command|
      command::COMMAND_REGEX =~ unparsed_command
    end
    (command_class || UnknownCommand).new(robot, unparsed_command)
  end

  private

  attr_accessor :unparsed_command, :robot, :commands
end
