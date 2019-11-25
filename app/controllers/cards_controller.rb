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
    @card = Card.new(card_params)

    if @card.save
      redirect_to @card
    else
      render 'new'
    end
  end

  def update
    @card = Card.find(params[:id])
    
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

  private

  def card
    @card ||= Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:original_text, :translated_text)
  end
end
