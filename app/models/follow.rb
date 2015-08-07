class Follow < ActiveRecord::Base
  belongs_to :follower, class_name: "Cat"
  belongs_to :followee, class_name: "Cat"
end