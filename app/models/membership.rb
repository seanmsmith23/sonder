class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :memorial

  validates :user_id, :memorial_id, presence: true

  def flip_permission
    if permission
      update(permission: false)
    else
      update(permission: true)
    end
  end

  def self.banned_users(memorial_id)
    where(memorial_id: memorial_id, permission: false)
  end

end
