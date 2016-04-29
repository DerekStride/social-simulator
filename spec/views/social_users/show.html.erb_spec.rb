require 'rails_helper'

RSpec.describe "social_users/show", type: :view do
  before(:each) do
    @social_user = assign(:social_user, SocialUser.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
