class CreateItemListUsers < ActiveRecord::Migration
  def change
    create_table :item_list_users do |t|
      t.integer :item_id
      t.integer :list_id
      t.integer :user_id
      t.timestamps
    end
  end
end
