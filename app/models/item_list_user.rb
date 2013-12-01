class ItemListUser < ActiveRecord::Base
  attr_accessible :item_id, :list_id, :user_id

  belongs_to :list
  belongs_to :user
end
