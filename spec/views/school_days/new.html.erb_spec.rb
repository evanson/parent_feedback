require 'spec_helper'

describe "school_days/new" do
  before(:each) do
    assign(:school_day, stub_model(SchoolDay,
      :name => "MyString",
      :abbrev => "MyString"
    ).as_new_record)
  end

  it "renders new school_day form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => school_days_path, :method => "post" do
      assert_select "input#school_day_name", :name => "school_day[name]"
      assert_select "input#school_day_abbrev", :name => "school_day[abbrev]"
    end
  end
end
