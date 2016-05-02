require 'rails_helper'

RSpec.describe Content, type: :model do
  let(:coding) { build(:tag, tag: 'coding') }
  let(:human) { build(:producer, name: 'Human') }
  let(:photo) do
    build(:content,
          name: 'Pretty Photo',
          tags: [coding],
          likes: [human],
          producer: human)
  end

  describe '#name' do
    it 'returns the name of the content' do
      expect(photo.name).to eq 'Pretty Photo'
    end
  end

  describe '#tags' do
    it 'returns the list of tags associated to the piece of content' do
      expect(photo.tags).to eq [coding]
    end
  end

  describe '#producer' do
    it 'returns the producer that made this piece of content' do
      expect(photo.producer).to eq human
    end
  end

  describe '#likes' do
    it 'returns the producer that made this piece of content' do
      expect(photo.likes).to eq [human]
    end
  end
end
