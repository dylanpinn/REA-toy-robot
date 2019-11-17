# frozen_string_literal: true

require 'cli_driver'
require 'tabletop'
require 'coordinates'
require 'direction'

RSpec.describe CLIDriver do
  subject(:driver) { described_class.new(tabletop, robot) }

  let(:tabletop) { instance_spy('Tabletop') }
  let(:robot) { instance_spy('Robot') }

  describe '#parse' do
    context 'when command is PLACE' do
      it 'calls place on the robot' do
        driver.parse('PLACE 0,0,NORTH')

        expect(robot).to have_received(:place).with(
          tabletop, instance_of(Coordinates), North
        )
      end
    end

    context 'when command is MOVE' do
      it 'calls move on the robot' do
        driver.parse('MOVE')

        expect(robot).to have_received(:move)
      end
    end

    context 'when command is REPORT' do
      it 'calls report on the robot' do
        driver.parse('REPORT')

        expect(robot).to have_received(:report)
      end
    end

    context 'when command is LEFT'
    context 'when command is RIGHT' do
      it 'calls right on the robot' do
        driver.parse('RIGHT')

        expect(robot).to have_received(:right)
      end
    end
  end
end
