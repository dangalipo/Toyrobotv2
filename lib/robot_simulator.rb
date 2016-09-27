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

  def initialize(commands_source:)
    self.commands_source = commands_source
    self.robot = Robot.new
    self.table_top = TableTop.new
  end

  def execute
    begin
      if commands_source == '-i'
        while true
          print 'Enter Command: '
          unparsed_command = STDIN.gets.chomp
          return if unparsed_command == 'exit'
          execute_command(unparsed_command)
        end
      else
        unparsed_commands.each do |unparsed_command|
          execute_command(unparsed_command)
        end
      end
    rescue Errno::ENOENT
      puts "File not found #{commands_source}"
    end
  end

private
  attr_accessor :commands_source, :robot, :table_top

  def execute_command(unparsed_command)
    begin
      command = CommandFactory.new(robot, unparsed_command).command
      command.execute(table_top)
    rescue PlaceCommand::InvalidDirectionError,
           PlaceCommand::InvalidPositionError,
           CommandFactory::UnrecognisedCommandError => e
      puts e.message
    end
  end

  def unparsed_commands
    @unparsed_commands ||= File.read(commands_source).split("\n")
  end
end
