# frozen_string_literal: true

require_relative 'coordinates'
require_relative 'direction'

# Driver for the application.
class CLIDriver
  attr_reader :robot, :tabletop

  # Whitelist commands.
  COMMANDS = {
    place: 'place',
    report: 'report',
    move: 'move',
    right: 'right',
    left: 'left'
  }.freeze

  def initialize(tabletop, robot)
    @tabletop = tabletop
    @robot = robot
  end

  def parse(input)
    return if input == ''

    input_array = input.downcase.split(' ')
    command = input_array.first.downcase
    args = input_array.drop(1)
    begin
      method = COMMANDS[command.to_sym]
      send(method, args) if method
    rescue NoMethodError
      nil
    end
  end

  private

  def place(args)
    args = args.join.delete(' ').split(',')

    return unless valid_args(args)

    x_coord = args[0].to_i
    y_coord = args[1].to_i

    coordinates = Coordinates.new(x_coord, y_coord)
    robot.place(tabletop, coordinates, direction(args[2]))
  end

  def valid_args(args)
    return false if args.length != 3
    return false unless number?(args[0])
    return false unless number?(args[1])
    return false unless valid_direction(args[2])

    true
  end

  def direction(arg)
    case arg
    when 'n', 'north' then North
    when 'e', 'east' then East
    when 's', 'south' then South
    when 'w', 'west' then West
    end
  end

  def valid_direction(string)
    /^([nesw]|(north)|(east)|(south)|(west))$/.match?(string)
  end

  def number?(string)
    true if Float(string)
  rescue StandardError
    false
  end

  def move(_args)
    robot.move
  end

  def right(_args)
    robot.right
  end

  def left(_args)
    robot.left
  end

  def report(_args)
    report_output = robot.report
    p report_output if report_output
  end
end
