class Command

  def execute(robot)
    raise NotImplementedError,
      "Subclasses of Command are exepected to implement #execute(robot)"
  end

end
