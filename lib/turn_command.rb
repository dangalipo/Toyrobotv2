class TurnCommand < Command
  COMMAND_REGEX = /^(LEFT|RIGHT)$/

  def initialize(robot, unparsed_command)
    super
    self.turn_direction = unparsed_command.match(COMMAND_REGEX)[1]
  end

  def execute(table_top)
    return unless robot.placed?

    current_direction = robot.direction
    new_direction = if turn_direction == 'LEFT'
                      table_top.direction_left_of_direction(current_direction)
                    else
                      table_top.direction_right_of_direction(current_direction)
                    end
    robot.turn_to_face(new_direction)
  end

  private

  attr_accessor :turn_direction
end
