class Image < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  belongs_to :user
  belongs_to :memorial
  has_many :likes, as: :likeable

  validates :image, :subtitle, presence: true

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  def crop_image
    image.recreate_versions! if crop_x.present?
  end

  def is_background?
    background
  end

  def type
    "images"
  end

end
