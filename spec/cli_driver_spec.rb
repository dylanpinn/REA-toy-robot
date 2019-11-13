# frozen_string_literal: true

require 'cli_driver'
require 'tabletop'
require 'coordinates'

RSpec.describe CLIDriver do
  subject(:driver) { described_class.new(tabletop, robot) }

  let(:tabletop) { instance_spy('Tabletop') }
  let(:robot) { instance_spy('Robot') }

  context 'when a robot has not been placed on the tabletop' do
    describe 'valid PLACE commands' do
      it 'places the robot on the tabletop' do
        driver.parse('PLACE 0,0,NORTH')

        expect(tabletop).to have_received(:place).with(
          robot, instance_of(Coordinates)
        )
      end

      it 'sets the direction on the robot' do
        driver.parse('PLACE 0,0,NORTH')

        expect(robot).to have_received(:initial_direction).with('NORTH')
      end
    end

    it 'ignores MOVE commands'
    it 'ignores LEFT commands'
    it 'ignores RIGHT commands'
    it 'ignores REPORT commands'
  end

  context 'when a robot has been placed on the tabletop' do
    before do
      driver.parse('PLACE 0,0,NORTH')
    end

    let(:tabletop) { Tabletop.new }
    let(:robot) { Robot.new }

    it 'handles PLACE commands'
    it 'handles MOVE commands'
    it 'handles LEFT commands'
    it 'handles RIGHT commands'
    it 'handles REPORT commands' do
      expect(driver.parse('REPORT')).to eq('1,0,NORTH')
    end
  end

  it 'ignores invalid PLACE commands'
end
