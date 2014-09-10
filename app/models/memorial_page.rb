class MemorialPage

  def initialize(memorial_id)
    @memorial = Memorial.find(memorial_id)
    @story = Story.new
    @post = Post.new
    @image = Image.new
  end

  def content
    @content = @memorial.stories + @memorial.posts + @memorial.images
  end

  def memorial
    @memorial
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

end