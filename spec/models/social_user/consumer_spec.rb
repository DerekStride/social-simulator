require 'rails_helper'

RSpec.describe Consumer, type: :model do
  let(:human) { build(:consumer, name: 'Human') }

  describe '#masterpieces' do
    it 'raises an error' do
      expect { human.masterpieces }.to raise_error NoMethodError
    end
  end
end
