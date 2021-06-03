class AddBookingPriceToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :bookingprice, :integer
  end
end
