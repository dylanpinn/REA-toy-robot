# frozen_string_literal: true

# Responsible for maintaining position of the robot.
class Tabletop
  attr_reader :width
  attr_reader :height
  attr_reader :robot
  # [0,0] considered to be SOUTH WEST most corner.
  attr_reader :robot_coordinates

  def initialize
    @width = 5
    @height = 5
  end

  # @param coordinates Array containing x,y coordinates.
  def place(robot, coordinates)
    return false unless valid_placement?(coordinates)

    @robot = robot
    @robot_coordinates = coordinates
  end

  private

  def valid_placement?(coordinates)
    return false unless coordinates.valid?
    return false if outside_of_bounds(coordinates)

    true
  end

  # Check if the coordinates are within Tabletop bounds.
  def outside_of_bounds(coordinates)
    return true if coordinates.x_coordinate >= @width

    return true if coordinates.y_coordinate >= @height

    false
  end
end
