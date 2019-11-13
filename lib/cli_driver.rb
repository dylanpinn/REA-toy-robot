# frozen_string_literal: true

require_relative 'coordinates'

# Driver for the application.
class CLIDriver
  def initialize(tabletop, robot)
    @tabletop = tabletop
    @robot = robot
  end

  def parse(command)
    # p command
    place(command) if command.start_with?('PLACE')
    p report if command == 'REPORT'
  end

  private

  def place(command)
    # TODO: Check if valid coordinates.
    # TODO: Check if valid direction.
    command = command.delete_prefix('PLACE')
    command.strip!
    commands = command.split(',')
    coordinates = Coordinates.new(commands[0].to_i, commands[1].to_i)
    @robot.initial_direction(commands[2])
    @tabletop.place(@robot, coordinates)
  end

  def report
    "#{@tabletop.robot_coordinates},#{@robot.direction}"
  end
end
