class AddColumnStrenghtToHeros < ActiveRecord::Migration[6.0]
  def change
    add_column :heros, :strength, :integer
  end
end


