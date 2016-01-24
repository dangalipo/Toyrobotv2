class RobotSimulator

  DIRECTIONS = %w[NORTH EAST SOUTH WEST].freeze
  MOVEMENTS = [[0,1], [-1,0],[0,-1], [1,0]].freeze
  def initialize(interactive:, instruction_set_file: nil )
    self.instruction_set_file = instruction_set_file
    self.place_command_recieved = false
  end

  def execute
    commands.each do |command|
      case command
      when /^PLACE [0-4],[0,4],(#{DIRECTIONS.join("|")})$/
        self.place_command_recieved = true
        parsed_command = command.match(/PLACE ([0-5]),([0-5]),(#{DIRECTIONS.join("|")})/)
        self.x_cord = parsed_command[1].to_i
        self.y_cord = parsed_command[2].to_i
        self.direction = DIRECTIONS.index(parsed_command[3])
      when /^(LEFT|RIGHT)$/
        next unless place_command_recieved
        if command == "LEFT"
          self.direction = (direction - 1) % DIRECTIONS.size
        else
          self.direction = (direction + 1) % DIRECTIONS.size
        end
      when /^MOVE$/
        next unless place_command_recieved
        self.x_cord += MOVEMENTS[direction][0] if (0..4).include?(self.x_cord + MOVEMENTS[direction][0])
        self.y_cord += MOVEMENTS[direction][1] if (0..4).include?(self.y_cord + MOVEMENTS[direction][1])
      when /^REPORT$/
        next unless place_command_recieved
        puts "#{self.x_cord},#{self.y_cord},#{DIRECTIONS[direction]}"
      else
        raise ArgumentError
      end
    end
  end

  attr_accessor :instruction_set_file, :x_cord, :y_cord, :direction,
   :place_command_recieved
private

  def commands
    @instructions ||= File.read(instruction_set_file).split("\n")
  end

end
