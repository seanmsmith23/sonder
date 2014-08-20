class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :memorial

  validates :user_id, :memorial_id, presence: true
end
