# frozen_string_literal: true

require 'valid_move'

# Responsible for controlling and reporting on the robot.
class Robot
  attr_reader :direction
  attr_reader :tabletop
  attr_reader :position

  def place(tabletop, coordinates, direction)
    return unless tabletop.valid_placement?(coordinates)

    @tabletop = tabletop
    @position = coordinates
    @direction = direction
  end

  def report
    "#{position},#{direction}" if placed?
  end

  def placed?
    !tabletop.nil?
  end

  # TODO: Remove conditionals
  def move
    if direction == 'NORTH'
      unless ValidMove.within_upper_bounds?(
        position.y_coordinate, tabletop.height
      )
        return
      end

      @position = position.move_north
    elsif direction == 'SOUTH'
      return unless ValidMove.within_lower_bounds?(position.y_coordinate)

      @position = position.move_south
    elsif direction == 'EAST'
      unless ValidMove.within_upper_bounds?(position.x_coordinate, tabletop.width)
        return
      end

      @position = position.move_east
    elsif direction == 'WEST'
      return unless ValidMove.within_lower_bounds?(position.x_coordinate)

      @position = position.move_west
    end
  end
end
