class User < ActiveRecord::Base
  has_many :posts
  has_many :likes, through: :posts
  has_many :comments
end
