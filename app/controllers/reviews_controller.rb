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
      redirect_to (@hero, anchor: "review-#{@review.id}")
    else
      list_path(@review.hero), alert: "Error"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @user = current_user
    @review.destroy
    redirect_to user_path(@user)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :hero_id, :user_id)
  end
end
