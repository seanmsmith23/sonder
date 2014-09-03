class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :memorial

  has_many :likes
end
