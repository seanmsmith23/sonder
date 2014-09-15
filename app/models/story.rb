class Story < ActiveRecord::Base
  belongs_to :user
  belongs_to :memorial

  has_many :likes, as: :likeable

  validates :story, presence: true
end
