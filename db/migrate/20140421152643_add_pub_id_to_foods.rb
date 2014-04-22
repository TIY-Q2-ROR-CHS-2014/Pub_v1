class AddPubIdToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :pub_id, :integer
  end
end
