require 'spec_helper'

describe "submissions/edit" do
  before(:each) do
    @submission = assign(:submission, stub_model(Submission,
      :question_id => 1
    ))
  end

  it "renders the edit submission form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", submission_path(@submission), "post" do
      assert_select "input#submission_question_id[name=?]", "submission[question_id]"
    end
  end
end
