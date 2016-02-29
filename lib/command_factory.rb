class CommandFactory

  class UnrecognisedCommandError < ArgumentError; end

  def initialize(unparsed_command)
    self.unparsed_command = unparsed_command
  end

  def command
    command_class = case unparsed_command
      when PlaceCommand::COMMAND_REGEX then PlaceCommand
      when TurnCommand::COMMAND_REGEX then TurnCommand
      when MoveCommand::COMMAND_REGEX then MoveCommand
      when ReportCommand::COMMAND_REGEX then ReportCommand
      else
        raise UnrecognisedCommandError, "Don't know how to process #{unparsed_command}"
    end
    command_class.new(unparsed_command)
  end

private

  attr_accessor :unparsed_command
end