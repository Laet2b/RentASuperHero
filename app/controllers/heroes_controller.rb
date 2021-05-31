class HeroesController < ApplicationController
  def index
    @heroes = Hero.all
  end

  def show
    @hero = Hero.find(params[:id])
  end

  def new
    @hero = Hero.new
  end

  def create
    @hero = Hero.new(hero_params)
    @user = User.find(params[:user_id])
    @hero.user = @user
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
    redirect_to heroes_path
  end

  private

  def hero_params
    params.require(:hero).permit(:user_id, :name, :category, :fullname, :publisher, :alignment, :picture)
  end

end
