class Image < ActiveRecord::Base
  belongs_to :user
  belongs_to :memorial

  has_many :likes, as: :likeable

  mount_uploader :image, ImageUploader
end
