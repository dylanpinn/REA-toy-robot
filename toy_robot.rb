# frozen_string_literal: true

require 'readline'
require_relative 'lib/cli_driver'
require_relative 'lib/tabletop'
require_relative 'lib/robot'

prompt = '> '

tabletop = Tabletop.new
robot = Robot.new
driver = CLIDriver.new(tabletop, robot)

# Print Instructions
p 'Toy Robot'
p '---------'
p 'Operations:'
p 'PLACE X, Y, DIRECTION  - Place the robot on the board'
p 'Other operations are ignored unless the robot has been placed on the board'
p 'MOVE - Move robot forward one place'
p 'LEFT - Rotate robot left 90 degrees'
p 'RIGHT - Rotate robot right 90 degrees'
p 'REPORT - Return the robot\'s position and direction'
p '<CTRL-c> - Quit the program'

while (buf = Readline.readline(prompt, true))
  driver.parse(buf.downcase)
end
