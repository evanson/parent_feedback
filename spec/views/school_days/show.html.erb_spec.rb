require 'spec_helper'

describe "school_days/show" do
  before(:each) do
    @school_day = assign(:school_day, stub_model(SchoolDay,
      :name => "Name",
      :abbrev => "Abbrev"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Abbrev/)
  end
end
