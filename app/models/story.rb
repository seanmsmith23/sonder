class Story < ActiveRecord::Base
  belongs_to :user
  belongs_to :memorial

  has_many :likes

  validates :story, presence: true
end
