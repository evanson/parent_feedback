require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :firstname => "Firstname",
        :lastname => "Lastname",
        :email => "Email",
        :password => "Password",
        :password_confirmation => "Password Confirmation"
      ),
      stub_model(User,
        :firstname => "Firstname",
        :lastname => "Lastname",
        :email => "Email",
        :password => "Password",
        :password_confirmation => "Password Confirmation"
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Firstname".to_s, :count => 2
    assert_select "tr>td", :text => "Lastname".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    assert_select "tr>td", :text => "Password Confirmation".to_s, :count => 2
  end
end
