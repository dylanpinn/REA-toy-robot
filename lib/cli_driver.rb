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
    # TODO: Ignore reset of commands if robot has not been placed.
    p report if command == 'REPORT'
  end

  private

  def place(command)
    # TODO: Check if valid coordinates.
    # TODO: Check if valid direction.
    commands = strip_coordinates(command)
    coordinates = Coordinates.new(commands[0].to_i, commands[1].to_i)
    @robot.place(@tabletop, coordinates, commands[2])
  end

  # TODO: Look at reloacting this.
  def strip_coordinates(command)
    command = command.delete_prefix('PLACE')
    command.strip!
    commands = command.split(',')
    commands
  end

  def report
    @robot.report
  end
end
