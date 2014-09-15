module MemorialsHelper

  def story_locals(story, name, id, memorial_id, likes, type)
    {story_text: story, name: name, story_id: id, memorial_id: memorial_id, likes: likes, type: type}
  end

  def post_locals(content, title, name, id, memorial_id, likes, type)
    {post_content: content, post_title: title, name: name, post_id: id, memorial_id: memorial_id, likes: likes, type: type}
  end

  def image_locals(image_text, image, id, name, memorial_id, likes, type)
    {image_text: image_text, image: image, name: name, image_id: id, memorial_id: memorial_id, likes: likes, type: type}
  end

  def create_locals(content, memorial)
    if content.class == Story
      story_locals(content.story, content.user.name, content.id, memorial.id, content.likes, Story.to_s)
    elsif content.class == Post
      post_locals(content.content, content.title, content.user.name, content.id, @memorial_page.memorial.id, content.likes, Post.to_s )
    elsif content.class == Image
      image_locals(content.subtitle, content.image, content.id, content.user.name, memorial.id, content.likes, Image.to_s)
    end
  end

end
