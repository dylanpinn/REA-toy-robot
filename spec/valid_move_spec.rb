# frozen_string_literal: true

require 'valid_move'
require 'tabletop'

RSpec.describe ValidMove do
  let(:tabletop) { Tabletop.new }

  describe '.within_upper_bounds?' do
    context 'when valid' do
      it 'can move NORTH or EAST' do
        expect(described_class.within_upper_bounds?(0, 5)).to be(true)
      end
    end

    context 'when invalid' do
      it 'cannot move NORTH or EAST' do
        expect(described_class.within_upper_bounds?(4, 5)).to be(false)
      end
    end
  end

  describe '.within_lower_bounds?' do
    context 'when valid' do
      it 'can move SOUTH or WEST' do
        expect(described_class.within_lower_bounds?(4)).to be(true)
      end
    end

    context 'when invalid' do
      it 'cannot move SOUTH or WEST' do
        expect(described_class.within_lower_bounds?(0)).to be(false)
      end
    end
  end
end
