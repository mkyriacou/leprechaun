class List < ActiveRecord::Base
  attr_accessible :user_id, :title, :description, :generally_i_like, :ping_if_reserved, :ping_if_bought, :expiry_date

  belongs_to :user
  has_many :list_users
  #has_many :users, through: :list_users
  has_many :items
end
