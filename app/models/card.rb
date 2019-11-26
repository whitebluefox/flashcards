# frozen_string_literal: true

class Card < ApplicationRecord
  before_validation :review_date_change

  validates :original_text, :translated_text, presence: true,
                                              length: { minimum: 2 }
  validates :review_date, presence: true

  validate :original_and_translated_not_equal

  private

  def original_and_translated_not_equal
    return unless original_text == translated_text
    errors.add(:original_text, "can't be equal")
  end

  def review_date_change
    self.review_date = Date.today + 3
  end
end
