require 'spec_helper'

describe "students/index" do
  before(:each) do
    assign(:students, [
      stub_model(Student,
        :firstname => "Firstname",
        :lastname => "Lastname",
        :center_id => 1
      ),
      stub_model(Student,
        :firstname => "Firstname",
        :lastname => "Lastname",
        :center_id => 1
      )
    ])
  end

  it "renders a list of students" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Firstname".to_s, :count => 2
    assert_select "tr>td", :text => "Lastname".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
