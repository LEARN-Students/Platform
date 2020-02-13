class Flashcard < ApplicationRecord
    validates :front, :back, :source, :subject, :user_id, presence: true
    belongs_to :user
end
