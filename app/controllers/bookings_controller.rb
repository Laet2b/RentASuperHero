class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @user = User.find(params[:user_id])
    @hero = Hero.find(params[:hero_id])
    @booking = Booking.new(booking_params)
    @booking.hero = @hero
    @booking.user = @user
    @booking.save
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render 'new'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :hero_id, :status)
  end
end