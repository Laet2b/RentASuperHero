class HerosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @heros = Hero.all
  end

  def show
    @hero = Hero.find(params[:id])
    @review = Review.new
  end

  def new
    @hero = Hero.new
  end

  def create
    @hero = Hero.new(hero_params)
    @hero.user = current_user
    @hero.save
    if @hero.save
      redirect_to hero_path(@hero)
    else
      render 'new'
    end
  end

  def destroy
    @hero = Hero.find(params[:id])
    @hero.destroy
    redirect_to user_path(current_user)
  end

  private

  def hero_params
    params.require(:hero).permit(:user_id, :name, :category, :fullname, :publisher, :alignment, :photo)
  end

end
