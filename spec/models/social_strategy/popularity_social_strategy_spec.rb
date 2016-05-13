require 'rails_helper'

RSpec.describe PopularitySocialStrategy, type: :model do
  describe '::search' do
    let!(:zombie) { build(:consumer) }
    let!(:content) { build(:content) }

    it 'should rake users by likes' do
      expect(zombie.liked_content).not_to include content
      PopularitySocialStrategy.socialize(zombie, [content])
      expect(zombie.liked_content).to include content
    end
  end
end
