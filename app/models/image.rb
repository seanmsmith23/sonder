class Image < ActiveRecord::Base
  belongs_to :user
  belongs_to :memorial

  mount_uploader :image, ImageUploader
end
