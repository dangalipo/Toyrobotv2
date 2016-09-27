require_relative 'coordinates.rb'
require_relative 'direction.rb'
require_relative "robot.rb"
require_relative "table_top.rb"
require_relative "command.rb"
require_relative "place_command.rb"
require_relative "turn_command.rb"
require_relative "move_command.rb"
require_relative "report_command.rb"
require_relative "command_factory.rb"
class RobotSimulator

  def initialize(commands_path:)
    self.commands_path = commands_path
    self.robot = Robot.new
    self.table_top = TableTop.new
  end

  def execute
    begin
      unparsed_commands.each do |unparsed_command|
        command = CommandFactory.new(robot, unparsed_command).command
        command.execute(table_top)
      end
    rescue PlaceCommand::InvalidDirectionError,
           PlaceCommand::InvalidPositionError,
           CommandFactory::UnrecognisedCommandError => e
      puts e.message
    rescue Errno::ENOENT
      puts "File not found #{commands_path}"
    end
  end

private
  attr_accessor :commands_path, :robot, :table_top

  def unparsed_commands
    @unparsed_commands ||= File.read(commands_path).split("\n")
  end
end
