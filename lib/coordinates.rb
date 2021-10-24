# frozen_string_literal: true

class Coordinates
  attr_reader :x_coordinate, :y_coordinate

  def initialize(x_coordinate:, y_coordinate:)
    self.x_coordinate = x_coordinate
    self.y_coordinate = y_coordinate
  end

  def to_s
    [x_coordinate, y_coordinate].join(',')
  end

  private

  attr_writer :x_coordinate, :y_coordinate
end
