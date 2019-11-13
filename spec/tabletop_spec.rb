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

  describe '#valid_placement?(coordinates)' do
    context 'when valid coordinates' do
      it 'is valid with 0 x value' do
        coordinates = Coordinates.new(0, 2)
        expect(tabletop.valid_placement?(coordinates)).to be(true)
      end

      it 'is valid with 0 y value'
      it 'is valid when x is within width'
      it 'is valid when y is within height'
    end

    context 'when invalid coordinates' do
      it 'is invalid when negative x value' do
        coordinates = Coordinates.new(-1, 2)
        expect(tabletop.valid_placement?(coordinates)).to be(false)
      end

      it 'is invalid when negative y value' do
        coordinates = Coordinates.new(1, -2)
        expect(tabletop.valid_placement?(coordinates)).to be(false)
      end

      it 'is invalid when incorrect x value' do
        coordinates = Coordinates.new(5, 4)
        expect(tabletop.valid_placement?(coordinates)).to be(false)
      end

      it 'is invalid when incorrect y value' do
        coordinates = Coordinates.new(4, 5)
        expect(tabletop.valid_placement?(coordinates)).to be(false)
      end
    end
  end
end
