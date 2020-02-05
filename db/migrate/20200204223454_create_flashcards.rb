class CreateFlashcards < ActiveRecord::Migration[6.0]
  def change
    create_table :flashcards do |t|
      t.text :front
      t.text :back
      t.string :subject
      t.string :source
      t.integer :user_id

      t.timestamps
    end
  end
end
