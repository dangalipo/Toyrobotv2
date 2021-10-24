class PlaceCommand < Command
  COMMAND_REGEX = /^PLACE (-?\d+),(-?\d+),(\w+)$/

  class InvalidPositionError < ArgumentError; end

  class InvalidDirectionError < ArgumentError; end

  def execute
    table_top = robot.table_top
    coordinates = Coordinates.new(x_coordinate: parsed_command[1].to_i,
                                  y_coordinate: parsed_command[2].to_i)
    direction = parsed_command[3]
    validate_coordinates(table_top, coordinates)
    validate_direction(table_top, direction)
    robot.place(coordinates, table_top.find_direction_by_name(direction))
  end

  private

  def parsed_command
    unparsed_command.match(COMMAND_REGEX)
  end

  def validate_coordinates(table_top, coordinates)
    return if table_top.valid_coordinates?(coordinates)

    raise InvalidPositionError,
          "Cannot place Robot at #{coordinates} as it is not on the table."
  end

  def validate_direction(table_top, direction)
    return if table_top.find_direction_by_name(direction)

    raise InvalidDirectionError,
          "Cannot place Robot facing #{direction} as it is not a valid direction."
  end
end
