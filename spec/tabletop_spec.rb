# frozen_string_literal: true

require 'tabletop'
require 'robot'
require 'coordinates'

RSpec.describe Tabletop do
  subject(:tabletop) { described_class.new }

  let(:coordinates) { instance_double(Coordinates) }

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
      it 'is valid with 0 x and y values' do
        allow(coordinates).to receive(:valid?).and_return(true)
        allow(coordinates).to receive(:x_coordinate).and_return(0)
        allow(coordinates).to receive(:y_coordinate).and_return(0)

        expect(tabletop.valid_placement?(coordinates)).to be(true)
      end

      it 'is valid when x is within width' do
        allow(coordinates).to receive(:valid?).and_return(true)
        allow(coordinates).to receive(:x_coordinate).and_return(4)
        allow(coordinates).to receive(:y_coordinate).and_return(0)

        expect(tabletop.valid_placement?(coordinates)).to be(true)
      end

      it 'is valid when y is within height' do
        allow(coordinates).to receive(:valid?).and_return(true)
        allow(coordinates).to receive(:x_coordinate).and_return(0)
        allow(coordinates).to receive(:y_coordinate).and_return(4)

        expect(tabletop.valid_placement?(coordinates)).to be(true)
      end
    end

    context 'when invalid coordinates' do
      it 'is invalid when negative x value' do
        allow(coordinates).to receive(:valid?).and_return(false)
        allow(coordinates).to receive(:x_coordinate).and_return(-1)
        allow(coordinates).to receive(:y_coordinate).and_return(2)

        expect(tabletop.valid_placement?(coordinates)).to be(false)
      end

      it 'is invalid when negative y value' do
        allow(coordinates).to receive(:valid?).and_return(false)
        allow(coordinates).to receive(:x_coordinate).and_return(1)
        allow(coordinates).to receive(:y_coordinate).and_return(-2)

        expect(tabletop.valid_placement?(coordinates)).to be(false)
      end

      it 'is invalid when incorrect x value' do
        allow(coordinates).to receive(:valid?).and_return(true)
        allow(coordinates).to receive(:x_coordinate).and_return(5)
        allow(coordinates).to receive(:y_coordinate).and_return(4)

        expect(tabletop.valid_placement?(coordinates)).to be(false)
      end

      it 'is invalid when incorrect y value' do
        allow(coordinates).to receive(:valid?).and_return(true)
        allow(coordinates).to receive(:x_coordinate).and_return(4)
        allow(coordinates).to receive(:y_coordinate).and_return(5)

        expect(tabletop.valid_placement?(coordinates)).to be(false)
      end
    end
  end
end
