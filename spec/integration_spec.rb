# frozen_string_literal: true

require 'cli_driver'

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
end
# rubocop:enable RSpec/DescribeClass
