class Memorial < ActiveRecord::Base

  has_many :memberships
  has_many :users, through: :memberships
  has_many :stories
  has_many :images
  has_many :posts

  validates :name, :born, :died, presence: true
end
