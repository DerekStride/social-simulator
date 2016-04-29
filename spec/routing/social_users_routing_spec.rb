require 'rails_helper'

RSpec.describe SocialUsersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/social_users').to route_to('social_users#index')
    end

    it 'routes to #new' do
      expect(get: '/social_users/new').to route_to('social_users#new')
    end

    it 'routes to #show' do
      expect(get: '/social_users/1').to route_to('social_users#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/social_users/1/edit').to route_to('social_users#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/social_users').to route_to('social_users#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/social_users/1').to route_to('social_users#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/social_users/1').to route_to('social_users#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/social_users/1').to route_to('social_users#destroy', id: '1')
    end
  end
end
