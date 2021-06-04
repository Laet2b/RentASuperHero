class AddColumnDurabilityToHeros < ActiveRecord::Migration[6.0]
  def change
    add_column :heros, :durability, :integer
  end
end
