# frozen_string_literal: true

require 'coordinates'

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
end
