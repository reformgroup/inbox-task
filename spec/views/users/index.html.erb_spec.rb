require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :last_name => "Last Name",
        :first_name => "First Name",
        :email => "Email",
        :gender => 1,
        :password_digest => "Password Digest",
        :remember_digest => "Remember Digest",
        :role => 2,
        :avatar => ""
      ),
      User.create!(
        :last_name => "Last Name",
        :first_name => "First Name",
        :email => "Email",
        :gender => 1,
        :password_digest => "Password Digest",
        :remember_digest => "Remember Digest",
        :role => 2,
        :avatar => ""
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 2
    assert_select "tr>td", :text => "Remember Digest".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
