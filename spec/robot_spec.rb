# frozen_string_literal: true

require 'robot'

RSpec.describe Robot do
  subject(:robot) { described_class.new }

  let(:tabletop) { instance_double(Tabletop) }
  let(:coordinates) { double }

  it 'has a direction' do
    expect(robot).to respond_to(:direction)
  end

  it 'has a tabletop' do
    expect(robot).to respond_to(:tabletop)
  end

  describe '#place' do
    it 'checks if the placement is valid' do
      allow(tabletop).to receive(:valid_placement?)

      robot.place(tabletop, coordinates, 'NORTH')

      expect(tabletop).to have_received(:valid_placement?).with(coordinates)
    end

    context 'when valid placement' do
      it 'places the robot on the board' do
        allow(tabletop).to receive(:valid_placement?).and_return(true)

        robot.place(tabletop, coordinates, 'NORTH')

        expect(robot.tabletop).not_to be_nil
      end

      it 'places the robot in the correct position' do
        allow(tabletop).to receive(:valid_placement?).and_return(true)

        robot.place(tabletop, coordinates, 'WEST')

        expect(robot.position).to be(coordinates)
      end

      it 'faces the robot in the correct direction' do
        allow(tabletop).to receive(:valid_placement?).and_return(true)

        robot.place(tabletop, coordinates, 'SOUTH')

        expect(robot.direction).to be('SOUTH')
      end
    end

    context 'when invalid placement' do
      it 'ignores the command' do
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
        allow(coordinates).to receive(:move_north).and_return(Coordinates.new(1, 3))

        robot.move

        expect(valid).to have_received(:within_upper_bounds?)
          .with(robot.position.y_coordinate - 1, tabletop.height)
      end

      it 'returns a new Coordinates object' do
        valid = class_double('ValidMove')
                .as_stubbed_const(transfer_nested_constants: true)
        allow(valid).to receive(:within_upper_bounds?)
          .with(robot.position.y_coordinate, tabletop.height).and_return(true)
        allow(coordinates).to receive(:move_north).and_return(Coordinates.new(1, 3))

        expect(robot.move).to be_instance_of(Coordinates)
      end

      # Robot placed at 1,2,NORTH
      context 'when move is valid' do
        before do
          valid = class_double('ValidMove')
                  .as_stubbed_const(transfer_nested_constants: true)
          allow(valid).to receive(:within_upper_bounds?).and_return(true)
          allow(valid).to receive(:within_lower_bounds?).and_return(true)
        end

        context 'when facing NORTH' do
          it 'moves 1 position in the y direction' do
            allow(coordinates).to receive(:move_north).and_return(Coordinates.new(1, 3))

            robot.move

            expect(robot.position.y_coordinate).to eq(3)
          end
        end

        context 'when facing SOUTH' do
          it 'moves -1 position in the y direction' do
            robot.place(tabletop, coordinates, 'SOUTH')
            allow(coordinates).to receive(:move_south).and_return(Coordinates.new(1, 1))

            robot.move

            expect(robot.position.y_coordinate).to eq(1)
          end
        end

        context 'when facing EAST' do
          it 'moves 1 position in the x direction' do
            robot.place(tabletop, coordinates, 'EAST')
            allow(coordinates).to receive(:move_east).and_return(Coordinates.new(2, 2))

            robot.move

            expect(robot.position.x_coordinate).to eq(2)
          end
        end

        context 'when facing WEST' do
          it 'moves -1 position in the x direction' do
            robot.place(tabletop, coordinates, 'WEST')
            allow(coordinates).to receive(:move_west).and_return(Coordinates.new(0, 2))

            robot.move

            expect(robot.position.x_coordinate).to eq(0)
          end
        end
      end

      context 'when move is invalid' do
        before do
          valid = class_double('ValidMove')
                  .as_stubbed_const(transfer_nested_constants: true)
          allow(valid).to receive(:within_upper_bounds?).and_return(false)
          allow(valid).to receive(:within_lower_bounds?).and_return(false)
        end

        it 'ignores the command' do
          expect { robot.move }.not_to change(robot, :position)
        end
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
