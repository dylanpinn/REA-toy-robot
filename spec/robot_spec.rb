# frozen_string_literal: true

require 'robot'

RSpec.describe Robot do
  subject(:robot) { described_class.new }

  let(:tabletop) { instance_double(Tabletop) }

  it 'has a direction' do
    expect(robot).to respond_to(:direction)
  end

  it 'has a tabletop' do
    expect(robot).to respond_to(:tabletop)
  end

  describe '#place' do
    it 'checks if the placement is valid' do
      coordinates = double
      allow(tabletop).to receive(:valid_placement?)

      robot.place(tabletop, coordinates, 'NORTH')

      expect(tabletop).to have_received(:valid_placement?).with(coordinates)
    end

    context 'when valid placement' do
      it 'places the robot on the board' do
        coordinates = double
        allow(tabletop).to receive(:valid_placement?).and_return(true)

        robot.place(tabletop, coordinates, 'NORTH')

        expect(robot.tabletop).not_to be_nil
      end

      it 'places the robot in the correct position' do
        coordinates = double
        allow(tabletop).to receive(:valid_placement?).and_return(true)

        robot.place(tabletop, coordinates, 'WEST')

        expect(robot.position).to be(coordinates)
      end

      it 'faces the robot in the correct direction' do
        coordinates = double
        allow(tabletop).to receive(:valid_placement?).and_return(true)

        robot.place(tabletop, coordinates, 'SOUTH')

        expect(robot.direction).to be('SOUTH')
      end
    end

    context 'when invalid placement' do
      it 'ignores the command' do
        coordinates = double
        allow(tabletop).to receive(:valid_placement?).and_return(false)

        robot.place(tabletop, coordinates, 'SOUTH')

        expect(robot.tabletop).to be_nil
      end
    end
  end

  context 'when the robot has been placed' do
    before do
      allow(tabletop).to receive(:height).and_return(5)
      allow(tabletop).to receive(:width).and_return(5)
      allow(tabletop).to receive(:valid_placement?).and_return(true)
      coordinates = double
      allow(coordinates).to receive(:y_coordinate).and_return(2)
      allow(coordinates).to receive(:x_coordinate).and_return(1)
      allow(coordinates).to receive(:to_s).and_return('1,2')
      robot.place(tabletop, coordinates, 'NORTH')
    end

    describe '#placed?' do
      it 'returns true' do
        expect(robot.placed?).to eq(true)
      end
    end

    describe '#report' do
      it 'reports the location and direction of the robot' do
        expect(robot.report).to eq('1,2,NORTH')
      end
    end

    describe '#move' do
      it 'checks with the board to see if the move is valid' do
        valid = class_double('ValidMove')
                .as_stubbed_const(transfer_nested_constants: true)
        allow(valid).to receive(:within_upper_bounds?)
          .with(robot.position.y_coordinate, tabletop.height).and_return(true)

        robot.move

        expect(valid).to have_received(:within_upper_bounds?)
          .with(robot.position.y_coordinate, tabletop.height)
      end

      # rubocop:disable RSpec/NestedGroups
      context 'when move is valid' do
        it 'moves forward in the direction it was facing 1 place'
      end

      context 'when move is invalid' do
        it 'ignores the command'
      end
      # rubocop:enable RSpec/NestedGroups
    end
  end

  context 'when the robot has not been placed' do
    describe '#placed?' do
      it 'returns false' do
        expect(robot.placed?).to eq(false)
      end
    end

    describe '#report' do
      xit 'ignores the command' do
        expect(robot.report).to eq(nil)
      end
    end

    describe '#move' do
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
end
