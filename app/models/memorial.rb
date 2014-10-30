class Memorial < ActiveRecord::Base

  has_many :memberships
  has_many :users, through: :memberships
  has_many :stories
  has_many :images
  has_many :posts

  accepts_nested_attributes_for :images

  validates :name, :born, :died, presence: true

  def allowed_images
    Image.joins(allowed_content_query("images", " AND images.background = false"))
  end

  def allowed_stories
    Story.joins(allowed_content_query("stories"))
  end

  def allowed_posts
    Post.joins(allowed_content_query("posts"))
  end

  private

  def allowed_content_query(content_table, options="")
    "INNER JOIN memberships ON #{content_table}.user_id = memberships.user_id AND #{content_table}.memorial_id = memberships.memorial_id WHERE memberships.permission = true#{options}"
  end

end
