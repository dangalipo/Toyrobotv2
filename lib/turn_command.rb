class TurnCommand < Command
  COMMAND_REGEX = /^(LEFT|RIGHT)$/

  def execute
    return unless robot.placed?

    table_top = robot.table_top
    turn_direction = unparsed_command.match(COMMAND_REGEX)[1]
    current_direction = robot.direction
    new_direction = if turn_direction == 'LEFT'
                      table_top.direction_left_of_direction(current_direction)
                    else
                      table_top.direction_right_of_direction(current_direction)
                    end
    robot.turn_to_face(new_direction)
  end
end
