class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
    	t.integer :list_id
    	t.integer :owner_id
    	t.integer :reserver_id
    	t.integer :buyer_id
    	t.string :item_name
    	t.string :category
    	t.string :known_locations
    	t.string :price_range
    	t.string :items_notes
    	t.string :image_link
    	t.string :item_link
    	t.boolean :owner_initiated
    	t.boolean :bought
      t.timestamps
    end
  end
end
