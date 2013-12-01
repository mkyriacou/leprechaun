class Item < ActiveRecord::Base
  attr_accessible :list_id, :owner_id, :reserver_id, :buyer_id, :item_name, :category, :known_locations, :price_range, :items_notes, :image_link, :item_link, :owner_initiated, :bought


end
