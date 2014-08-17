class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, :last_name, :email, :password_digest, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
end
