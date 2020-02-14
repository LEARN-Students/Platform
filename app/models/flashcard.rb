class Flashcard < ApplicationRecord
    validates :front, :back, :subject, :user_id, presence: true
    belongs_to :user
end
