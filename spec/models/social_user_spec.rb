require 'rails_helper'

RSpec.describe SocialUser, type: :model do
  describe '#name' do
    let(:human) { build(:social_user, name: 'Human') }

    it 'returns the users name' do
      expect(human.name).to eq('Human')
    end
  end

  describe '#tags' do
    let(:coding) { build(:tag, tag: 'coding') }
    let(:human) { build(:social_user, tags: [coding]) }

    it 'returns the list of tags for the users' do
      expect(human.tags).to eq [coding]
    end
  end

  describe '#followers' do
    let(:zombie) { build(:social_user) }
    let(:human) { build(:social_user, followers: [zombie]) }

    it 'returns the list of followers for the users' do
      expect(human.followers).to eq [zombie]
    end
  end

  describe '#producers' do
    let!(:human) { create(:producer) }

    it 'returns the list of all producers' do
      expect(SocialUser.producers).to eq [human]
    end
  end

  describe '#consumers' do
    let!(:zombie) { create(:consumer) }

    it 'returns the list of all consumers' do
      expect(SocialUser.consumers).to eq [zombie]
    end
  end

  describe '#liked_content' do
    let(:photo) { build(:content) }
    let(:human) { build(:social_user, liked_content: [photo]) }

    it 'returns the list of content liked by the user' do
      expect(human.liked_content).to eq [photo]
    end
  end

  describe '#search_strategy' do
    let(:human) { build(:social_user, search_strategy: SearchStrategy) }

    it 'should be a valid search_strategy' do
      expect(human.search_strategy).to eq 'SearchStrategy'
    end
  end

  describe '#social_strategy' do
    let(:human) { build(:social_user, social_strategy: SocialStrategy) }

    it 'should be a valid social_strategy' do
      expect(human.social_strategy).to eq 'SocialStrategy'
    end
  end
end
