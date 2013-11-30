class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
    	t.integer :user_id
    	t.string :title
    	t.string :description
    	t.text :generally_i_like
    	t.boolean :ping_if_reserved
    	t.boolean :ping_if_bought
    	t.timestamps :expiry_date

      t.timestamps
    end
  end
end
