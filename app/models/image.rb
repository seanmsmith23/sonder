class Image < ActiveRecord::Base
  belongs_to :user
  belongs_to :memorial

  has_many :likes, as: :likeable

  validates :image, :subtitle, presence: true

  mount_uploader :image, ImageUploader
end
