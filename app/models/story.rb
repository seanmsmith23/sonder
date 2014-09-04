class Story < ActiveRecord::Base
  belongs_to :user
  belongs_to :memorial

  has_many :storylikes

  validates :story, presence: true
end
