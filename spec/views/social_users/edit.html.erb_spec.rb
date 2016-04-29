require 'rails_helper'

RSpec.describe 'social_users/edit', type: :view do
  before(:each) do
    @social_user = assign(:social_user, SocialUser.create!(name: 'MyString'))
  end

  it 'renders the edit social_user form' do
    render

    assert_select 'form[action=?][method=?]', social_user_path(@social_user), 'post' do
      assert_select 'input#social_user_name[name=?]', 'social_user[name]'
    end
  end
end
