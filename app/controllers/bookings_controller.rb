class BookingsController < ApplicationController

before_action :authenticate_user!, only: :create

  def index
    @bookings = Booking.where(params[:user_id])
    @user = current_user
    @hero = Hero.find(params[:hero_id])
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @hero = Hero.find(params[:hero_id])
    @booking = Booking.new
    @booking.hero = @hero
    @booking.user = current_user
    @booking.status = false
    @booking.save
    if @booking.save
      redirect_to hero_bookings_path(@hero)
    else
      render 'new'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @hero = @booking.hero_id
    @booking.destroy
      redirect_to hero_bookings_path(@hero)
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :hero_id, :status)
  end
end
