require 'rails_helper'

RSpec.describe Producer, type: :model do
  let(:photo) { build(:content, name: 'Pretty Photo') }
  let(:human) { build(:producer, name: 'Human', masterpieces: [photo]) }

  describe '#masterpieces' do
    it 'returns the list of content that the producer created' do
      expect(human.masterpieces).to eq [photo]
    end
  end
end
