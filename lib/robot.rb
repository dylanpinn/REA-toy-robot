# frozen_string_literal: true

# Responsible for controlling and reporting on the robot.
class Robot
  attr_reader :direction

  def initial_direction(direction)
    @direction = direction
  end
end
