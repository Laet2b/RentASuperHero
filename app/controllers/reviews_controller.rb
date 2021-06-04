class ReviewsController < ApplicationController
  def new
    @hero = Hero.find(params[:list_id])
    @review = Review.new
  end

  def create
    @hero = Hero.find(params[:hero_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.hero = @hero
    if @review.save
      redirect_to hero_path(@hero, anchor: "review-display")
    else
      list_path(@review.hero)
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @user = current_user
    @review.destroy
    redirect_to user_path(@user, anchor: "review-delete")
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :hero_id, :user_id)
  end
end
