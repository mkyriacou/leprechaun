class ListUser < ActiveRecord::Base
  attr_accessible :user_id, :list_id

  has_many :users
  belongs_to :list
end
