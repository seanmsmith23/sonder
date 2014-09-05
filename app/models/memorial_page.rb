class MemorialPage

  def initialize(memorial_id)
    @memorial = Memorial.find(memorial_id)
    @stories = Story.where(memorial_id: memorial_id)
    @story = Story.new
    @post = Post.new
    @posts = Post.where(memorial_id: memorial_id)
  end

  def content
    @content = @stories + @posts
  end

  def memorial
    @memorial
  end

  def stories
    @stories
  end

  def new_story
    @story
  end

  def posts
    @posts
  end

  def new_post
    @post
  end

end