# frozen_string_literal: true

class CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  def show
    @card = Card.find(params[:id])
  end

  def new; end

  def create
    @card = Card.new(card_params)

    @card.save
    redirect_to @card
  end

  private

  def card_params
    params.require(:card).permit(:original_text, :translated_text, :review_date)
  end
end
