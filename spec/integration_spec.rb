# frozen_string_literal: true

require 'cli_driver'
require 'robot'
require 'tabletop'

# rubocop:disable RSpec/DescribeClass
RSpec.describe 'Integration' do
  let(:driver) do
    robot = Robot.new
    tabletop = Tabletop.new
    return CLIDriver.new(tabletop, robot)
  end

  it 'returns Example a' do
    driver.parse('PLACE 0,0,NORTH')
    driver.parse('MOVE')
    expect { driver.parse('REPORT') }.to output(/0,1,NORTH/).to_stdout
  end

  it 'can rotate right' do
    driver.parse('PLACE 0,0,NORTH')
    driver.parse('RIGHT')
    expect { driver.parse('REPORT') }.to output(/0,0,EAST/).to_stdout
  end

  it 'returns Example b' do
    driver.parse('PLACE 0,0,NORTH')
    driver.parse('LEFT')
    expect { driver.parse('REPORT') }.to output(/0,0,WEST/).to_stdout
  end

  # rubocop:disable RSpec/ExampleLength
  it 'returns Example c' do
    driver.parse('PLACE 1,2,EAST')
    driver.parse('MOVE')
    driver.parse('MOVE')
    driver.parse('LEFT')
    driver.parse('MOVE')
    expect { driver.parse('REPORT') }.to output(/3,3,NORTH/).to_stdout
  end
  # rubocop:enable RSpec/ExampleLength
end
# rubocop:enable RSpec/DescribeClass
