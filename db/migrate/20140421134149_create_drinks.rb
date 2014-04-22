class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.integer :pub_id
      t.string :name
      t.string :cost
      t.text :description

      t.timestamps
    end
  end
end
