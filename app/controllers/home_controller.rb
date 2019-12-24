class HomeController < ApplicationController
  def index
    @card = Card.for_review.sample
  end  
end
