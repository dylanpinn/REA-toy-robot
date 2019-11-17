# frozen_string_literal: true

# rubocop:disable RSpec/MultipleDescribes
RSpec.describe North do
  describe '.right' do
    it 'returns a new East direction' do
      expect(described_class.right).to eq(East)
    end
  end
end

RSpec.describe East do
  describe '.right' do
    it 'returns a new South direction' do
      expect(described_class.right).to eq(South)
    end
  end
end

RSpec.describe South do
  describe '.right' do
    it 'returns a new West direction' do
      expect(described_class.right).to eq(West)
    end
  end
end

RSpec.describe West do
  describe '.right' do
    it 'returns a new North direction' do
      expect(described_class.right).to eq(North)
    end
  end
end
# rubocop:enable RSpec/MultipleDescribes
