require 'rails_helper'

RSpec.describe 'Simulations', type: :request do
  describe 'GET /simulations' do
    it 'works! (now write some real specs)' do
      get simulations_path
      expect(response).to have_http_status(200)
    end
  end
end
