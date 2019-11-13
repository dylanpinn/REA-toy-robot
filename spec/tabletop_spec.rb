# frozen_string_literal: true

require 'tabletop'
require 'robot'
require 'coordinates'

RSpec.describe Tabletop do
  subject(:tabletop) { described_class.new }

  describe 'dimensions' do
    it 'a width of 5' do
      expect(tabletop.width).to be(5)
    end

    it 'a height of 5' do
      expect(tabletop.height).to be(5)
    end
  end

  describe '#place(robot)' do
    let(:robot) { Robot.new }

    context 'when valid placement' do
      it 'places the robot on the board' do
        tabletop.place(robot, Coordinates.new(0, 0))
        expect(tabletop.robot).not_to be_nil
      end

      it 'places the robot in the correct position' do
        coordinates = Coordinates.new(4, 4)
        tabletop.place(robot, coordinates)
        expect(tabletop.robot_coordinates).to be(coordinates)
      end

      # TODO: Move out into CLI operations.
      it 'faces the robot in the correct direction'
    end

    context 'when invalid placement' do
      it 'ignores the command' do
        tabletop.place(robot, Coordinates.new(6, 8))
        expect(tabletop.robot).to be_nil
      end

      it 'is invalid when negative x value' do
        expect(tabletop.place(robot, Coordinates.new(-1, 2))).to be(false)
      end

      it 'is invalid when negative y value' do
        expect(tabletop.place(robot, Coordinates.new(1, -2))).to be(false)
      end

      it 'is invalid when incorrect x value' do
        expect(tabletop.place(robot, Coordinates.new(5, 4))).to be(false)
      end

      it 'is invalid when incorrect y value' do
        expect(tabletop.place(robot, Coordinates.new(4, 5))).to be(false)
      end
    end
  end
end
