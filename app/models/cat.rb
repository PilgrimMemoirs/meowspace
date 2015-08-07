class Cat < ActiveRecord::Base
  has_many :meows
  has_many :likes

  has_many :followers, class_name: 'Follow', foreign_key: 'followee_id'
  has_many :following, class_name: 'Follow', foreign_key: 'follower_id'
end