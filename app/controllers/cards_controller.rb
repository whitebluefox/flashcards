# frozen_string_literal: true

class CardsController < ApplicationController
  before_action :card, only: %i[show edit update destroy]

  def index
    @cards = Card.all
  end

  def show; end

  def new
    @card = Card.new
  end

  def edit; end

  def create
    card = Card.new(card_params)

    if card.save
      redirect_to card
    else
      render 'new'
    end
  end

  def update
    if card.update(card_params)
      redirect_to card
    else
      render 'edit'
    end
  end

  def destroy
    card.destroy

    redirect_to cards_path
  end

  def check_card
    card_id = params[:card_values][:card_id]
    text_for_review = params[:card_values][:original_text]

    if CardReviewService.new(card_id, text_for_review).call
      flash[:notice] = 'You guessed!'
    else
      flash[:notice] = 'nope'
    end

    redirect_to home_path
  end

  private

  def card
    @card ||= Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:original_text, :translated_text)
  end
end
