class AddColumnPowerToHeros < ActiveRecord::Migration[6.0]
  def change
    add_column :heros, :power, :integer
  end
end
