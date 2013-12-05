class ListUser < ActiveRecord::Base
  attr_accessible :user_id, :list_id

  belongs_to :list
  belongs_to :user
end
