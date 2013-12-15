require 'spec_helper'

describe "works/show" do
  before(:each) do
    @work = assign(:work, stub_model(Work,
      :student_id => 1,
      :subject_id => 2,
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Status/)
  end
end
