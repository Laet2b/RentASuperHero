class BookingsController < ApplicationController

  def index
    @bookings = Booking.where(params[:user_id])
    @user = current_user
    @hero = Hero.find(params[:hero_id])
    @user = current_user
  end

  def show
    @booking = Booking.find(params[:id])
    @user = current_user
  end

  def new
    @booking = Booking.new
    @hero = Hero.find(params[:hero_id])
    @user = current_user
  end

  def create
    @hero = Hero.find(params[:hero_id])
    @user = current_user
    @nbofdays = (params[:booking][:end].to_datetime - params[:booking][:beginning].to_datetime).to_i
    @bookingprice = @nbofdays * @hero.price_per_day
    flash.alert = "You will pay #{@bookingprice}€"
    @booking = Booking.new(booking_params)
    @booking.hero = @hero
    @booking.user = @user
    @booking.bookingprice = @bookingprice
    @booking.status = nil
    @booking.save
    if @booking.save
      redirect_to user_path(@user)
    else
      render 'show'
    end
  end

  def edit
    @user = current_user
    @booking = Booking.find(params[:id])
  end

  def update
    @hero = Hero.find(params[:hero_id])
    @user = current_user
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user = current_user
    @booking = Booking.find(params[:id])
    @hero = @booking.hero_id
    @booking.destroy
      redirect_to user_path(@user)
  end


  private

  def booking_params
    params.require(:booking).permit(:user_id, :hero_id, :status, :beginning, :end, :bookingprice)
  end
end
