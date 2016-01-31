require_relative "../lib/robot_simulator"

if ARGV.size == 1
  RobotSimulator.new(commands_path: ARGV[0]).execute
else
  puts "Invocation: ruby toy_robot <PATH_TO_COMMAND_FILE>"
end
