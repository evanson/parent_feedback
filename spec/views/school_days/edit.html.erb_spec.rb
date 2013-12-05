require 'spec_helper'

describe "school_days/edit" do
  before(:each) do
    @school_day = assign(:school_day, stub_model(SchoolDay,
      :name => "MyString",
      :abbrev => "MyString"
    ))
  end

  it "renders the edit school_day form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => school_days_path(@school_day), :method => "post" do
      assert_select "input#school_day_name", :name => "school_day[name]"
      assert_select "input#school_day_abbrev", :name => "school_day[abbrev]"
    end
  end
end
