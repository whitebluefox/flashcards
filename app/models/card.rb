# frozen_string_literal: true

class Card < ApplicationRecord
  validates :original_text, :translated_text, presence: true, length: {minimum: 2}
  validates :review_date, presence: true

  validate :original_and_translated_not_equal
  def original_and_translated_not_equal
    if original_text == translated_text
      errors.add(:original_text, "can't be equal")
    end
  end
end
