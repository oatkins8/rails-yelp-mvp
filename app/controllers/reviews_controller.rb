class ReviewsController < ApplicationController
  before_action :set_restaurant

  def new
    # set_restaurant (see above)
    @review = Review.new
  end

  def create
    # set restaurant
    @review = Review.new(review_params)
    @review.restaurant = @restaurant # need to tell the review which restaurant it is about and assign it to that restaurant
    # set the restaurant to the params --> saying set the review.restaurant to the current restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant) # go back to the show page of the restaurant in question
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :review) # create the strong params
  end
end
