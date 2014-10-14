class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :memorial

  has_many :likes, as: :likeable

  validates :title, :content, presence: true
  validates :content, length: {maximum: 2000}
end
