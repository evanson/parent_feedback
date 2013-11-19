require 'spec_helper'

describe "centers/new" do
  before(:each) do
    assign(:center, stub_model(Center,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new center form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => centers_path, :method => "post" do
      assert_select "input#center_name", :name => "center[name]"
    end
  end
end
