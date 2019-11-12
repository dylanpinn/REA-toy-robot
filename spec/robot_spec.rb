# frozen_string_literal: true

require 'robot'

RSpec.describe Robot do
  subject(:robot) { described_class.new }

  it 'has a direction' do
    expect(robot).to respond_to(:direction)
  end

  it 'has a board'

  describe '#move' do
    it 'checks with the board to see if the move is valid'

    context 'when move is valid' do
      it 'moves forward in the direction it was facing 1 place'
    end

    context 'when move is invalid' do
      it 'ignores the command'
    end
  end

  describe '#left' do
    it 'rotates the robot 90 degrees left'
  end

  describe '#right' do
    it 'rotates the robot 90 degrees right'
  end

  describe '#report' do
    it 'reports the location and direction of the robot'
  end
end
