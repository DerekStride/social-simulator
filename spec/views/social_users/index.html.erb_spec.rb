require 'rails_helper'

RSpec.describe 'social_users/index', type: :view do
  before(:each) do
    assign(:social_users, [
      SocialUser.create!(name: 'Name'),
      SocialUser.create!(name: 'Name')
    ])
  end

  it 'renders a list of social_users' do
    render
    assert_select 'tr>td', text: 'Name', count: 2
  end
end
