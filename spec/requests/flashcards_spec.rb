require 'rails_helper'

RSpec.describe "Flashcards", type: :request do
  describe "GET /flashcards" do
    it "works! (now write some real specs)" do
      get flashcards_path
      expect(response).to have_http_status(200)
    end
  end
end
