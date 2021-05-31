class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :hero, null: false, foreign_key: true
      t.boolean :status

      t.timestamps
    end
  end
end
