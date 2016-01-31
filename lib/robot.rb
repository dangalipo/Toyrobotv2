class Robot

  attr_accessor :x_position, :y_position, :direction,
    :placed

  def initialize
    self.placed = false
  end

  def placed?
    placed
  end

end
