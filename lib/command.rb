class Command
  def initialize(robot, unparsed_command)
    self.robot = robot
    self.unparsed_command = unparsed_command
  end

  def execute(_table_top)
    raise NoMethodError,
          'Subclasses of Command are exepected to implement #execute(table_top)'
  end

  protected

  attr_accessor :robot, :unparsed_command
end
