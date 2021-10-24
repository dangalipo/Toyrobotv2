class Direction
  attr_reader :name, :move_x, :move_y

  def initialize(name:, move_x:, move_y:)
    self.name = name
    self.move_x = move_x
    self.move_y = move_y
  end

  private

  attr_writer :name, :move_x, :move_y
end
