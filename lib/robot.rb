class Robot

  attr_accessor :x_position, :y_position, :direction
  attr_accessor :placed

  def initialize
    self.placed = false
  end

  def placed?
    placed
  end

end
