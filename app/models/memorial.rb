class Memorial < ActiveRecord::Base

  has_many :memberships
  has_many :users, through: :memberships
  has_many :stories

  validates :name, :born, :died, presence: true
end
