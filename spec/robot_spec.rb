# frozen_string_literal: true

require 'robot'
require 'tabletop'
require 'coordinates'

RSpec.describe Robot do
  subject(:robot) { described_class.new }

  let(:tabletop) { Tabletop.new }

  it 'has a direction' do
    expect(robot).to respond_to(:direction)
  end

  it 'has a tabletop' do
    expect(robot).to respond_to(:tabletop)
  end

  describe '#place' do
    context 'when valid placement' do
      it 'places the robot on the board' do
        robot.place(tabletop, Coordinates.new(0, 0), 'NORTH')
        expect(robot.tabletop).not_to be_nil
      end

      it 'places the robot in the correct position' do
        coordinates = Coordinates.new(4, 4)
        robot.place(tabletop, coordinates, 'WEST')
        expect(robot.position).to be(coordinates)
      end

      it 'faces the robot in the correct direction' do
        coordinates = Coordinates.new(4, 4)
        robot.place(tabletop, coordinates, 'SOUTH')
        expect(robot.direction).to be('SOUTH')
      end
    end

    context 'when invalid placement' do
      it 'ignores the command' do
        robot.place(tabletop, Coordinates.new(6, 8), 'EAST')
        expect(robot.tabletop).to be_nil
      end
    end
  end

  describe '#move' do
    it 'checks with the board to see if the move is valid'

    context 'when move is valid' do
      it 'moves forward in the direction it was facing 1 place'
    end

    context 'when move is invalid' do
      it 'ignores the command'
    end

    context 'when robot has not been placed' do
      it 'ignores the command'
    end
  end

  describe '#left' do
    it 'rotates the robot 90 degrees left'
    context 'when robot has not been placed' do
      it 'ignores the command'
    end
  end

  describe '#right' do
    it 'rotates the robot 90 degrees right'
    context 'when robot has not been placed' do
      it 'ignores the command'
    end
  end

  describe '#report' do
    it 'reports the location and direction of the robot' do
      robot.place(tabletop, Coordinates.new(1, 2), 'SOUTH')

      expect(robot.report).to eq('1,2,SOUTH')
    end

    context 'when robot has not been placed' do
      it 'ignores the command'
    end
  end
end
