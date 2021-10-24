class Command
  def initialize(robot)
    self.robot = robot
  end

  def execute(_table_top)
    raise NotImplementedError,
          'Subclasses of Command are exepected to implement #execute(table_top)'
  end

  protected

  attr_accessor :robot
end
