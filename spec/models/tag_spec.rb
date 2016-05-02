require 'rails_helper'

RSpec.describe Tag, type: :model do
  let(:photo) { build(:content, name: 'Pretty Photo') }
  let(:zombie) { build(:social_user, name: 'Zombie') }
  let(:coding) { build(:tag, tag: 'coding', users: [zombie], contents: [photo]) }

  describe '#tag' do
    it 'returns the tags value' do
      expect(coding.tag).to eq('coding')
    end
  end

  describe '#users' do
    it 'returns the list of users that have this tag' do
      expect(coding.users).to eq [zombie]
    end
  end

  describe '#contents' do
    it 'returns the list of contents that have this tag' do
      expect(coding.contents).to eq [photo]
    end
  end
end
