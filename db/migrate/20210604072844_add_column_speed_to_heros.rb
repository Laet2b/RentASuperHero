class AddColumnSpeedToHeros < ActiveRecord::Migration[6.0]
  def change
    add_column :heros, :speed, :integer
  end
end
