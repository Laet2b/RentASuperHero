require 'json'
require 'rest-client'

class HerosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @heros = Hero.all
    @user = current_user
  end

  def show
    @hero = Hero.find(params[:id])
    @booking = Booking.new
    @review = Review.new
    @user = current_user
    @average = average(@hero.id)
    @price_per_day = @hero.price_per_day
    @time = Time.new.strftime("%Y-%m-%d")
  end

  def new
    @hero = Hero.new
    @user = current_user
  end

  def create
    @user = current_user
    @hero = Hero.new(hero_params)
    @hero.user = current_user
    hero_api
    @hero.save
    if @hero.save
      redirect_to hero_path(@hero, anchor: "booking-info")
    else
      render 'new', alert: "Error"
    end
  end

  def destroy
    @user = current_user
    @hero = Hero.find(params[:id])
    @hero.destroy
    redirect_to user_path(@user, anchor: "owner-heroes-delete")
  end

  def average(hero_id)
    @reviews = Review.where(hero_id: hero_id)
    @ratingarray = []
    if @reviews == []
      @average = nil
    else
      @reviews.each do |review|
        @ratingarray << review.rating
      end
      @average = @ratingarray.inject(0, :+) / @ratingarray.count
    end
    return @average
  end

  # def price_per_booking
  #    beginnin
  # end

  private

  def hero_params
    params.require(:hero).permit(:user_id, :name, :photo, :price_per_day)
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
