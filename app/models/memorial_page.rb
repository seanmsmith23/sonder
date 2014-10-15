class MemorialPage

  attr_accessor :memorial

  def initialize(memorial_id)
    @memorial_id = memorial_id
    @memorial = Memorial.find(@memorial_id)
    @story = Story.new
    @post = Post.new
    @image = Image.new
  end

  def content
    @content = @memorial.stories + @memorial.posts + @memorial.images
  end

  def new_story
    @story
  end

  def new_post
    @post
  end

  def new_image
    @image
  end

  def carousel_images
    @images = Image.where(memorial_id: @memorial_id, background: true)
  end

  def images
    @images = Image.where(memorial_id: @memorial_id, background: false)
  end

end