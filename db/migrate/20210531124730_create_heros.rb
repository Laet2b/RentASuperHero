class CreateHeros < ActiveRecord::Migration[6.0]
  def change
    create_table :heros do |t|
      t.string :name
      t.string :category
      t.references :user, null: false, foreign_key: true
      t.string :fullname
      t.string :publisher
      t.string :alignment
      t.text :picture

      t.timestamps
    end
  end
end
