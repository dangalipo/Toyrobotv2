class PlaceCommand < Command
  COMMAND_REGEX = /^PLACE (-?\d+),(-?\d+),(\w+)$/

  class InvalidPositionError < ArgumentError; end
  class InvalidDirectionError < ArgumentError; end

  def initialize(unparsed_command)
    parsed_command = unparsed_command.match(COMMAND_REGEX)
    self.x_position = parsed_command[1].to_i
    self.y_position = parsed_command[2].to_i
    self.direction = parsed_command[3]
  end

  def execute(robot, world)
    validate!(world)
    coordinates = Coordinates.new(x_coordinate: x_position,
                                  y_coordinate: y_position)
    robot.place(coordinates, world.find_direction_by_name(direction))
  end

private

  def validate!(world)
    unless world.on_x_plane?(x_position) && world.on_y_plane?(y_position)
      raise InvalidPositionError,
        "Cannot place Robot at #{x_position}, #{y_position} as it is not on the table."
      TEXT
    end
    unless world.find_direction_by_name(direction)
      raise InvalidDirectionError,
        "Cannot place Robot facing #{direction} as it is not a valid direction."
    end
  end

  attr_accessor :x_position, :y_position, :direction

end
