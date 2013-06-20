require 'spec_helper'

describe "submissions/new" do
  before(:each) do
    assign(:submission, stub_model(Submission,
      :question_id => 1
    ).as_new_record)
  end

  it "renders new submission form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", submissions_path, "post" do
      assert_select "input#submission_question_id[name=?]", "submission[question_id]"
    end
  end
end
