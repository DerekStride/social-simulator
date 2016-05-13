require 'rails_helper'

RSpec.describe SearchStrategy, type: :model do
  describe '::search' do
    it 'should rake users by likes' do
      expect { SearchStrategy.search(nil, nil) }.to raise_error NotImplementedError
    end
  end
end
