class PlaceCommand < Command
  COMMAND_REGEX = /^PLACE (-?\d+),(-?\d+),(\w+)$/

  class InvalidPositionError < ArgumentError; end

  class InvalidDirectionError < ArgumentError; end

  def initialize(robot, unparsed_command)
    super(robot)
    parsed_command = unparsed_command.match(COMMAND_REGEX)
    self.coordinates = Coordinates.new(x_coordinate: parsed_command[1].to_i,
                                       y_coordinate: parsed_command[2].to_i)
    self.direction = parsed_command[3]
  end

  def execute(table_top)
    validate(table_top)
    robot.place(coordinates, table_top.find_direction_by_name(direction))
  end

  private

  attr_accessor :coordinates, :direction

  def validate(table_top)
    unless table_top.valid_coordinates?(coordinates)
      raise InvalidPositionError,
            "Cannot place Robot at #{coordinates} as it is not on the table."
      TEXT
    end
    unless table_top.find_direction_by_name(direction)
      raise InvalidDirectionError,
            "Cannot place Robot facing #{direction} as it is not a valid direction."
    end
  end
end
