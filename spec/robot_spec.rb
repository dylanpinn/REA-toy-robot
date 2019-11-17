# frozen_string_literal: true

require 'robot'
require 'tabletop'
require 'direction'

RSpec.describe Robot do
  subject(:robot) { described_class.new }

  let(:tabletop) { instance_double(Tabletop) }
  let(:coordinates) { double }
  let(:direction) { class_spy('Direction') }

  it 'has a direction' do
    expect(robot).to respond_to(:direction)
  end

  it 'has a tabletop' do
    expect(robot).to respond_to(:tabletop)
  end

  describe '#place' do
    it 'checks if the placement is valid' do
      allow(tabletop).to receive(:valid_placement?)

      robot.place(tabletop, coordinates, direction)

      expect(tabletop).to have_received(:valid_placement?).with(coordinates)
    end

    context 'when valid placement' do
      it 'places the robot on the board' do
        allow(tabletop).to receive(:valid_placement?).and_return(true)

        robot.place(tabletop, coordinates, direction)

        expect(robot.tabletop).not_to be_nil
      end

      it 'places the robot in the correct position' do
        allow(tabletop).to receive(:valid_placement?).and_return(true)

        robot.place(tabletop, coordinates, direction)

        expect(robot.position).to be(coordinates)
      end

      it 'faces the robot in the correct direction' do
        allow(tabletop).to receive(:valid_placement?).and_return(true)

        robot.place(tabletop, coordinates, direction)

        expect(robot.direction).to be(direction)
      end
    end

    context 'when invalid placement' do
      it 'ignores the command' do
        allow(tabletop).to receive(:valid_placement?).and_return(false)

        robot.place(tabletop, coordinates, direction)

        expect(robot.tabletop).to be_nil
      end
    end
  end

  context 'when the robot has been placed' do
    # TODO: Change this to build a placed robot and not fudge it.
    before do
      allow(tabletop).to receive(:height).and_return(5)
      allow(tabletop).to receive(:width).and_return(5)
      allow(tabletop).to receive(:valid_placement?).and_return(true)
      allow(coordinates).to receive(:y_coordinate).and_return(2)
      allow(coordinates).to receive(:x_coordinate).and_return(1)
      allow(coordinates).to receive(:to_s).and_return('1,2')
      allow(direction).to receive(:to_s).and_return('North')
      robot.place(tabletop, coordinates, direction)
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
      it 'checks if the move is valid' do
        new_position = double
        allow(coordinates).to receive(:move).and_return(new_position)

        robot.move

        expect(tabletop).to have_received(:valid_placement?).with(new_position)
      end

      it 'changes the robots position' do
        new_position = double
        allow(coordinates).to receive(:move).and_return(new_position)

        expect { robot.move }.to change(robot, :position).to(new_position)
      end

      # TODO: Fix this as not actually testing the correct thing.
      # xcontext 'when move is invalid' do
      #   before do
      #     allow(tabletop).to receive(:valid_placement?).and_return(false)
      #   end

      #   xit 'ignores the command' do
      #     expect { robot.move }.not_to change(robot, :position)
      #   end
      # end
    end

    describe '#right' do
      it 'calls right on the direction' do
        robot.right

        expect(direction).to have_received(:right)
      end

      it 'changes the direction' do
        new_direction = double
        allow(direction).to receive(:right).and_return(new_direction)

        expect { robot.right }.to change(robot, :direction).to(new_direction)
      end
    end
  end

  context 'when the robot has not been placed' do
    describe '#placed?' do
      it 'returns false' do
        expect(robot.placed?).to eq(false)
      end
    end

    describe '#report' do
      it 'ignores the command' do
        expect(robot.report).to eq(nil)
      end
    end

    describe '#move' do
      it 'ignores the command' do
        expect { robot.move }.not_to change(robot, :position)
      end
    end

    describe '#right' do
      it 'ignores the command' do
        expect { robot.right }.not_to change(robot, :direction)
      end
    end
  end

  describe '#left' do
    it 'rotates the robot 90 degrees left'
    context 'when robot has not been placed' do
      it 'ignores the command'
    end
  end
end
