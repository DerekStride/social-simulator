require 'rails_helper'

RSpec.describe Simulation, type: :model do
  let(:coding) { build(:tag) }
  let(:human) { build(:producer) }
  let(:photo) { build(:content) }
  let(:simulation) { build(:simulation, users: [human], tags: [coding], content: [photo]) }

  describe '#users' do
    it 'returns the users contained in the simulation' do
      expect(simulation.users).to eq [human]
    end
  end

  describe '#tags' do
    it 'returns the tags contained in the simulation' do
      expect(simulation.tags).to eq [coding]
    end
  end

  describe '#content' do
    it 'returns the contents contained in the simulation' do
      expect(simulation.content).to eq [photo]
    end
  end
end
