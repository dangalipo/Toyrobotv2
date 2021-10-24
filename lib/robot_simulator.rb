require_relative 'coordinates'
require_relative 'direction'
require_relative 'robot'
require_relative 'table_top'
require_relative 'command'
require_relative 'place_command'
require_relative 'turn_command'
require_relative 'move_command'
require_relative 'report_command'
require_relative 'unknown_command'
require_relative 'command_factory'
class RobotSimulator
  def initialize(commands_source:)
    self.commands_source = commands_source
    self.robot = Robot.new
    self.table_top = TableTop.new
  end

  def execute
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

  private

  attr_accessor :commands_source, :robot, :table_top

  def execute_command(unparsed_command)
    command = CommandFactory.new(robot: robot, unparsed_command: unparsed_command).command
    command.execute(table_top)
  rescue PlaceCommand::InvalidDirectionError,
         PlaceCommand::InvalidPositionError,
         UnknownCommand::UnknownCommandError => e
    puts e.message
  end

  def unparsed_commands
    @unparsed_commands ||= File.read(commands_source).split("\n")
  end
end
