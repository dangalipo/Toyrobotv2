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

  def execute(robot)
    validate!
    coordinates = Coordinates.new(x_coordinate: x_position,
                                  y_coordinate: y_position)
    robot.place(coordinates, World.direction_names.index(direction))
  end

private

  def validate!
    unless World.on_x_plane?(x_position) && World.on_y_plane?(y_position)
      raise InvalidPositionError,
        "Cannot place Robot at #{x_position}, #{y_position} as it is not on the table."
      TEXT
    end
    unless World.direction_names.include?(direction)
      raise InvalidDirectionError,
        "Cannot place Robot facing #{direction} as it is not a valid direction."
    end
  end

  attr_accessor :x_position, :y_position, :direction

end
