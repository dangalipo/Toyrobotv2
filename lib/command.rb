# frozen_string_literal: true

class Command
  def initialize(robot, unparsed_command)
    self.robot = robot
    self.unparsed_command = unparsed_command
  end

  def execute
    raise NoMethodError,
          'Subclasses of Command are exepected to implement #execute'
  end

  protected

  attr_accessor :robot, :unparsed_command
end
