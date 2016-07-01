require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :last_name => "Last Name",
      :first_name => "First Name",
      :email => "Email",
      :gender => 1,
      :password_digest => "Password Digest",
      :remember_digest => "Remember Digest",
      :role => 2,
      :avatar => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Password Digest/)
    expect(rendered).to match(/Remember Digest/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
