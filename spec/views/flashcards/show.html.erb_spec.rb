require 'rails_helper'

RSpec.describe "flashcards/show", type: :view do
  before(:each) do
    @flashcard = assign(:flashcard, Flashcard.create!(
      :front => "MyText",
      :back => "MyText",
      :subject => "Subject",
      :source => "Source",
      :user_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Subject/)
    expect(rendered).to match(/Source/)
    expect(rendered).to match(/2/)
  end
end
