class AddColumnPricePerDayToHeros < ActiveRecord::Migration[6.0]
  def change
    add_column :heros, :price_per_day, :integer
  end
end
