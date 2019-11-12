# frozen_string_literal: true

require 'tabletop'

RSpec.describe Tabletop do
  subject(:tabletop) { described_class.new }

  it 'has 5x5 dimensions'

  describe '#place(robot)' do
    context 'when valid placement' do
      it 'places the robot on the board'
      it 'places the robot in the correct position'
      it 'faces the robot in the correct direction'
    end

    context 'when invalid placement' do
      it 'ignores the command'
    end
  end

  describe '#valid_move?' do
    it 'checks if a move is valid'
  end
end
