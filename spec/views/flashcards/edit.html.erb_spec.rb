require 'rails_helper'

RSpec.describe "flashcards/edit", type: :view do
  before(:each) do
    @flashcard = assign(:flashcard, Flashcard.create!(
      :front => "MyText",
      :back => "MyText",
      :subject => "MyString",
      :source => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit flashcard form" do
    render

    assert_select "form[action=?][method=?]", flashcard_path(@flashcard), "post" do

      assert_select "textarea[name=?]", "flashcard[front]"

      assert_select "textarea[name=?]", "flashcard[back]"

      assert_select "input[name=?]", "flashcard[subject]"

      assert_select "input[name=?]", "flashcard[source]"

      assert_select "input[name=?]", "flashcard[user_id]"
    end
  end
end
