class Memorial < ActiveRecord::Base

  has_many :memberships
  has_many :users, through: :memberships

  validates :name, :born, :died, presence: true
end
