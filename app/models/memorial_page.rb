class MemorialPage

  attr_accessor :memorial

  def initialize(memorial_id)
    @memorial_id = memorial_id
    @memorial = Memorial.find(@memorial_id)
  end

  def content
    @content = @memorial.stories + @memorial.posts + @memorial.images
  end

  def new_story
    @story = Story.new
  end

  def new_post
    @post = Post.new
  end

  def new_image
    @image = Image.new
  end

  def carousel_images
    @images = Image.where(memorial_id: @memorial_id, background: true)
  end

  def images
    @images = Image.where(memorial_id: @memorial_id, background: false)
  end

end