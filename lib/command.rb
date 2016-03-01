class Command

  def execute(robot, world)
    raise NotImplementedError,
      "Subclasses of Command are exepected to implement #execute(robot, world)"
  end

end
