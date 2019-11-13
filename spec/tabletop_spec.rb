# frozen_string_literal: true

require 'tabletop'
require 'robot'

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
        coordinates = Coordinates.new(1, 2)
        tabletop.place(robot, coordinates)
        expect(tabletop.robot_coordinates).to be(coordinates)
      end

      # TODO: Move out into CLI operations.
      it 'faces the robot in the correct direction'
    end

    context 'when invalid placement' do
      it 'ignores the command' do
        tabletop.place(robot, Coordinates.new(-1, 0))
        expect(tabletop.robot).to be_nil
      end
    end
  end

  describe '#valid_move?' do
    it 'checks if a move is valid'
  end
end
