class User < ActiveRecord::Base
  has_secure_password

  has_many :memberships
  has_many :memorials, through: :memberships
  has_many :comments

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}

  def name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
