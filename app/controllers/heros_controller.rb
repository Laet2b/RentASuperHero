require 'json'
require 'rest-client'

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
    hero_api
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
    params.require(:hero).permit(:user_id, :name, :photo)
  end

  def hero_api
    url = "https://superheroapi.com/api/6256070421085368"

    hero_json = RestClient.get("#{url}/search/#{@hero.name}")
    hero_json = JSON.parse(hero_json)

    @hero.category = hero_json["results"][0]["work"]['occupation']
    @hero.publisher = hero_json["results"][0]["biography"]['publisher']
    @hero.alignment = hero_json["results"][0]["biography"]['alignment']
    @hero.fullname = hero_json["results"][0]["biography"]['full-name']

    if @hero.photo.attached?

    else
      @hero.picture = hero_json["results"][0]["image"]['url']
    end
    @hero
  end

end
