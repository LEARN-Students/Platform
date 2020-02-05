require "rails_helper"

RSpec.describe FlashcardsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/flashcards").to route_to("flashcards#index")
    end

    it "routes to #new" do
      expect(:get => "/flashcards/new").to route_to("flashcards#new")
    end

    it "routes to #show" do
      expect(:get => "/flashcards/1").to route_to("flashcards#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/flashcards/1/edit").to route_to("flashcards#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/flashcards").to route_to("flashcards#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/flashcards/1").to route_to("flashcards#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/flashcards/1").to route_to("flashcards#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/flashcards/1").to route_to("flashcards#destroy", :id => "1")
    end
  end
end
