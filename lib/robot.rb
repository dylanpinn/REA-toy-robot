# frozen_string_literal: true

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

  def move
    return unless placed?

    new_position = position.move(direction)
    return unless tabletop.valid_placement?(new_position)

    @position = new_position
  end
end
