# frozen_string_literal: true

# Check if a set of coordinates are valid for a tabletop.
class Coordinates
  attr_reader :x_coordinate
  attr_reader :y_coordinate

  def initialize(x_coordinate, y_coordinate)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
  end

  # Check if initial coordinates are valid
  def valid?
    return false if @x_coordinate.negative? || @y_coordinate.negative?

    true
  end

  def to_s
    "#{@x_coordinate},#{y_coordinate}"
  end

  def move_north
    new(x_coordinate, y_coordinate + 1)
  end

  def move_south
    new(x_coordinate, y_coordinate - 1)
  end

  def move_east
    new(x_coordinate + 1, y_coordinate)
  end

  def move_west
    new(x_coordinate - 1, y_coordinate)
  end
end
