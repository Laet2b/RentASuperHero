class AddColumnCombatToHeros < ActiveRecord::Migration[6.0]
  def change
    add_column :heros, :combat, :integer
  end
end
