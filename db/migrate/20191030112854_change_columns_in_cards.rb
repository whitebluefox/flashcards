class ChangeColumnsInCards < ActiveRecord::Migration[5.2]
  def up
    rename_column(:cards, :original, :original_text)
    rename_column(:cards, :translated, :translated_text)
    rename_column(:cards, :review, :review_date)
  end

  def down
    rename_column(:cards, :original_text, :original)
    rename_column(:cards, :translated_text, :translated)
    rename_column(:cards, :review_date, :review)
  end
end
