require 'rails_helper'

RSpec.describe PopularitySearchStrategy, type: :model do
  describe '::search' do
    let!(:zombie) { create(:consumer) }
    let!(:human) { create(:consumer) }
    let!(:derek) { create(:consumer) }
    let!(:content) { create(:content, likes: [zombie, human, derek]) }
    let!(:photo) { create(:content, likes: [zombie, derek]) }
    let!(:file) { create(:content, likes: [zombie]) }

    it 'should rake users by likes' do
      expect(PopularitySearchStrategy.search(zombie, 3)).to eq [content, photo, file]
    end
  end
end
