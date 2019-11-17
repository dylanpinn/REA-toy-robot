# frozen_string_literal: true

require 'coordinates'
require 'direction'

RSpec.describe Coordinates do
  describe '#valid?' do
    context 'when invalid' do
      it 'must not have negative x value' do
        expect(described_class.new(-1, 0).valid?).to be(false)
      end

      it 'must not have negative y value' do
        expect(described_class.new(0, -5).valid?).to be(false)
      end
    end
  end

  describe '#to_s' do
    it 'returns the x and y coordinates, comma separated' do
      expect(described_class.new(1, 2).to_s).to eq('1,2')
    end
  end

  describe '#move' do
    let(:direction) do
      class_double('Direction')
        .as_stubbed_const(transfer_nested_constants: true)
    end

    it 'creates a new Coordinates object' do
      expect(
        described_class.new(1, 2).move(direction)
      ).to be_instance_of(described_class)
    end

    it 'creates a new object using the directions X_MOVE value' do
      stub_const('Direction::X_MOVE', 5)
      expect(
        described_class.new(0, 0).move(direction).x_coordinate
      ).to eq(5)
    end

    it 'creates a new object using the directions Y_MOVE value' do
      stub_const('Direction::Y_MOVE', 2)
      expect(
        described_class.new(0, 1).move(direction).y_coordinate
      ).to eq(3)
    end
  end
end
