require 'spec_helper'

describe "centers/edit" do
  before(:each) do
    @center = assign(:center, stub_model(Center,
      :name => "MyString"
    ))
  end

  it "renders the edit center form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => centers_path(@center), :method => "post" do
      assert_select "input#center_name", :name => "center[name]"
    end
  end
end
