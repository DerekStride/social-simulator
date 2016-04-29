require 'rails_helper'

RSpec.describe "social_users/new", type: :view do
  before(:each) do
    assign(:social_user, SocialUser.new(
      :name => "MyString"
    ))
  end

  it "renders new social_user form" do
    render

    assert_select "form[action=?][method=?]", social_users_path, "post" do

      assert_select "input#social_user_name[name=?]", "social_user[name]"
    end
  end
end
