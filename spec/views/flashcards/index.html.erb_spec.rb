require 'rails_helper'

RSpec.describe "flashcards/index", type: :view do
  before(:each) do
    assign(:flashcards, [
      Flashcard.create!(
        :front => "MyText",
        :back => "MyText",
        :subject => "Subject",
        :source => "Source",
        :user_id => 2
      ),
      Flashcard.create!(
        :front => "MyText",
        :back => "MyText",
        :subject => "Subject",
        :source => "Source",
        :user_id => 2
      )
    ])
  end

  # it "renders a list of flashcards" do
  #   render
  #   assert_select "tr>td", :text => "MyText".to_s, :count => 2
  #   assert_select "tr>td", :text => "MyText".to_s, :count => 2
  #   assert_select "tr>td", :text => "Subject".to_s, :count => 2
  #   assert_select "tr>td", :text => "Source".to_s, :count => 2
  #   assert_select "tr>td", :text => 2.to_s, :count => 2
  # end
end
