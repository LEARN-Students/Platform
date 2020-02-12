class Flashcard < ApplicationRecord
    require 'open-uri'
    validates :front, :back, :source, :subject, :user_id, presence: true
    belongs_to :user
    open(:source).status => ["200","OK"], on:create
end
