# frozen_string_literal: true

require 'readline'
require_relative 'lib/cli_driver'
require_relative 'lib/tabletop'
require_relative 'lib/robot'

prompt = '> '

tabletop = Tabletop.new
robot = Robot.new
driver = CLIDriver.new(tabletop, robot)

while (buf = Readline.readline(prompt, true))
  driver.parse(buf.downcase)
end
