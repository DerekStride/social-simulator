require 'rails_helper'

RSpec.describe Tag, type: :model do
  let(:zombie) { build(:social_user, name: 'Zombie') }
  let(:coding) { build(:tag, tag: 'coding', users: [zombie]) }

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
end
