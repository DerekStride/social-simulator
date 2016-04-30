require 'rails_helper'

RSpec.describe SocialUser, type: :model do
  let(:coding) { build(:tag, tag: 'coding') }
  let(:netflix) { build(:tag, tag: 'netflix') }
  let(:zombie) { build(:consumer, name: 'Zombie') }
  let(:human) do
    build(:producer,
          name: 'Human',
          tags: [coding, netflix],
          followers: [zombie])
  end

  describe '#name' do
    it 'returns the users name' do
      expect(human.name).to eq('Human')
    end
  end

  describe '#tags' do
    it 'returns the list of tags for the users' do
      expect(human.tags).to eq [coding, netflix]
    end
  end

  describe '#followers' do
    it 'returns the list of followers for the users' do
      expect(human.followers).to eq [zombie]
    end
  end

  describe '#producers' do
    it 'returns the list of all producers' do
      human.save!
      expect(SocialUser.producers).to eq [human]
    end
  end

  describe '#consumers' do
    it 'returns the list of all consumers' do
      zombie.save!
      expect(SocialUser.consumers).to eq [zombie]
    end
  end
end
