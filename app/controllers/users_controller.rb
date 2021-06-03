class UsersController < ApplicationController
  before_action :set_user

  def show
    @user = current_user
    @heros = Hero.all
    @reviews = Review.all
    @bookings = Booking.all
    @time = Time.new.strftime("%Y-%m-%d")
  end

  def edit
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:email, :photo, :password, :pseudo)
  end

  def set_user
    @user = current_user
  end
end
