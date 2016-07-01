require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :last_name => "MyString",
      :first_name => "MyString",
      :email => "MyString",
      :gender => 1,
      :password_digest => "MyString",
      :remember_digest => "MyString",
      :role => 1,
      :avatar => ""
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_last_name[name=?]", "user[last_name]"

      assert_select "input#user_first_name[name=?]", "user[first_name]"

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_gender[name=?]", "user[gender]"

      assert_select "input#user_password_digest[name=?]", "user[password_digest]"

      assert_select "input#user_remember_digest[name=?]", "user[remember_digest]"

      assert_select "input#user_role[name=?]", "user[role]"

      assert_select "input#user_avatar[name=?]", "user[avatar]"
    end
  end
end
