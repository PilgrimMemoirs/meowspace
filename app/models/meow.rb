class Meow < ActiveRecord::Base
  belongs_to :cat
  has_many :likes
end