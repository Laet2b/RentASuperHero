class AddColumnIntelligenceToHeros < ActiveRecord::Migration[6.0]
  def change
    add_column :heros, :intelligence, :integer
  end
end
