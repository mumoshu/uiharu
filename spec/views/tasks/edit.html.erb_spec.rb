require 'spec_helper'

describe "tasks/edit" do
  before(:each) do
    @task = assign(:task, stub_model(Task,
      :title => "MyString",
      :assignee_id => 1,
      :assignor_id => 1
    ))
  end

  it "renders the edit task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", task_path(@task), "post" do
      assert_select "input#task_title[name=?]", "task[title]"
      assert_select "input#task_assignee_id[name=?]", "task[assignee_id]"
      assert_select "input#task_assignor_id[name=?]", "task[assignor_id]"
    end
  end
end
