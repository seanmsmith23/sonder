class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :memorial

  has_many :likes

  validates :comment, presence: true
end
