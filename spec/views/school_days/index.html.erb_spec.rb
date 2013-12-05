require 'spec_helper'

describe "school_days/index" do
  before(:each) do
    assign(:school_days, [
      stub_model(SchoolDay,
        :name => "Name",
        :abbrev => "Abbrev"
      ),
      stub_model(SchoolDay,
        :name => "Name",
        :abbrev => "Abbrev"
      )
    ])
  end

  it "renders a list of school_days" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Abbrev".to_s, :count => 2
  end
end
