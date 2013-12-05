require 'spec_helper'

describe "students/new" do
  before(:each) do
    assign(:student, stub_model(Student,
      :firstname => "MyString",
      :lastname => "MyString",
      :center_id => 1
    ).as_new_record)
  end

  it "renders new student form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => students_path, :method => "post" do
      assert_select "input#student_firstname", :name => "student[firstname]"
      assert_select "input#student_lastname", :name => "student[lastname]"
      assert_select "input#student_center_id", :name => "student[center_id]"
    end
  end
end
