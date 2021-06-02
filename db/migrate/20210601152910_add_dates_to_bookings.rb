class AddDatesToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :beginning, :date
    add_column :bookings, :end, :date
  end
end
