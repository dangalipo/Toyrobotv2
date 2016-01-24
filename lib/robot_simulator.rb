require_relative "robot.rb"
require_relative "world.rb"
require_relative "place_command.rb"
require_relative "turn_command.rb"
require_relative "move_command.rb"
require_relative "report_command.rb"
class RobotSimulator

  def initialize(interactive:, instruction_set_file: nil )
    self.instruction_set_file = instruction_set_file
    self.robot = Robot.new
  end

  def execute
    commands.each do |command|
      command_class = case command
      when PlaceCommand::COMMAND_REGEX then PlaceCommand
      when TurnCommand::COMMAND_REGEX then TurnCommand
      when MoveCommand::COMMAND_REGEX then MoveCommand
      when ReportCommand::COMMAND_REGEX then ReportCommand
      else
        raise ArgumentError
      end
      command_class.new(command).execute(robot)
    end
  end

  attr_accessor :instruction_set_file, :robot
private

  def commands
    @commands ||= File.read(instruction_set_file).split("\n")
  end
end
