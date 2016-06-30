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

  describe '#destroy' do
    it 'will destroy the dependent users' do
      simulation.save!
      expect {
        simulation.destroy!
      }.to change(SocialUser, :count).by(-1)
    end

    it 'will destroy the dependent tags' do
      simulation.save!
      expect {
        simulation.destroy!
      }.to change(Tag, :count).by(-1)
    end

    it 'will destroy the dependent content' do
      simulation.save!
      expect {
        simulation.destroy!
      }.to change(Content, :count).by(-1)
    end
  end

  describe '#simulate' do
    context 'with valid simulation params' do
      it 'creates a new simulation ready to be run' do
        expect {
          Simulation.simulate(valid_simulation_params)
        }.to change(Simulation, :count).by(1)
      end

      it 'creates users' do
        sim = Simulation.simulate(valid_simulation_params)
        expect(sim.users.size).to eq 1
      end

      it 'creates tags' do
        sim = Simulation.simulate(valid_simulation_params)
        expect(sim.tags.size).to eq 1
      end
    end

    context 'without valid simulation params' do
      it 'should raise an error' do
        expect {
          Simulation.simulate({})
        }.to raise_error(KeyError)
      end
    end
  end
end

def valid_simulation_params
  {
    'users_attributes' => {
      '0' => {
        'quantity' => '1',
        'role' => 'Producer',
        'search_strategy' => 'Popularity',
        'social_strategy' => 'Popularity'
      }
    },
    'tags_attributes' => {
      'quantity' => '1',
      'avg' => '0',
      'stddev' => '1'
    }
  }
end
