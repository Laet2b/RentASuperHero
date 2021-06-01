class UsersController < ApplicationController
  before_action :set_user

  def show
    @heros = Hero.all
    @reviews = Review.all
  end

  def edit
  end

  def update
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
