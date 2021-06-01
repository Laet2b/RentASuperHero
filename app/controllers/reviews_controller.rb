class ReviewsController < ApplicationController
  def new
    @hero = Hero.find(params[:list_id])
    @review = Review.new
  end

  def create
    @hero = Hero.find(params[:hero_id])
    @review = Review.new(review_params)
    @review.hero = @hero
    if @review.save
      redirect_to @hero
    else
      list_path(@review.hero)
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to hero_path(@review.hero)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :hero_id)
  end
end
