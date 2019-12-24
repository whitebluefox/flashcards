class CardReviewService
  attr_reader :card, :text_for_review

  def initialize(card_id, text_for_review)
    @card = Card.find_by(id: card_id)
    @text_for_review = text_for_review
  end

  def call
    if card.present? && check_translation
      review_date_change
      true
    else
      false
    end
  end

  private

  def check_translation
    card.original_text == text_for_review
  end

  def review_date_change
    card.update(review_date: Date.today + 3)
  end
end
