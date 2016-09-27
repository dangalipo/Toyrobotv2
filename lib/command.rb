class Command

  def initialize(robot)
    self.robot = robot
  end

  def execute(_world)
    raise NotImplementedError,
      "Subclasses of Command are exepected to implement #execute(world)"
  end

  protected

  attr_accessor :robot
end
