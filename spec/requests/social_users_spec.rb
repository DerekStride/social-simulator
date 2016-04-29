require 'rails_helper'

RSpec.describe 'SocialUsers', type: :request do
  describe 'GET /social_users' do
    it 'works! (now write some real specs)' do
      get social_users_path
      expect(response).to have_http_status(200)
    end
  end
end
