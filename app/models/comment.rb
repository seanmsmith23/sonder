class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :memorial

  validates :comment, presence: true
end
