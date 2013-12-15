require 'spec_helper'

describe "works/edit" do
  before(:each) do
    @work = assign(:work, stub_model(Work,
      :student_id => 1,
      :subject_id => 1,
      :status => "MyString"
    ))
  end

  it "renders the edit work form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => works_path(@work), :method => "post" do
      assert_select "input#work_student_id", :name => "work[student_id]"
      assert_select "input#work_subject_id", :name => "work[subject_id]"
      assert_select "input#work_status", :name => "work[status]"
    end
  end
end
