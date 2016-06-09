require 'rails_helper'

RSpec.describe SimulationsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/simulations').to route_to('simulations#index')
    end

    it 'routes to #new' do
      expect(get: '/simulations/new').to route_to('simulations#new')
    end

    it 'routes to #show' do
      expect(get: '/simulations/1').to route_to('simulations#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/simulations').to route_to('simulations#create')
    end

    it 'routes to #destroy' do
      expect(delete: '/simulations/1').to route_to('simulations#destroy', id: '1')
    end
  end
end
