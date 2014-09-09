class Image < ActiveRecord::Base
  belongs_to :user_id
  belongs_to :memorial

  mount_uploader(:image, ImageUploader)
end
