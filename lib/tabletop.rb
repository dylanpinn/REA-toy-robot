# frozen_string_literal: true

# Responsible for maintaining position of the robot.
class Tabletop
  attr_reader :width
  attr_reader :height

  def initialize
    @width = 5
    @height = 5
  end

  def valid_placement?(coordinates)
    return false unless coordinates.valid?
    return false if outside_of_bounds(coordinates)

    true
  end

  private

  # Check if the coordinates are within Tabletop bounds.
  def outside_of_bounds(coordinates)
    return true if coordinates.x_coordinate >= @width

    return true if coordinates.y_coordinate >= @height

    false
  end
end
