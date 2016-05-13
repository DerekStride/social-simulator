require 'rails_helper'

RSpec.describe SocialStrategy, type: :model do
  describe '::search' do
    it 'should rake users by likes' do
      expect { SocialStrategy.socialize(nil, nil) }.to raise_error NotImplementedError
    end
  end
end
