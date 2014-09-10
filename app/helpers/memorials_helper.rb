module MemorialsHelper

  def story_locals(story, name, id, memorial_id, likes)
    {story_text: story, name: name, story_id: id, memorial_id: memorial_id, likes: likes}
  end

  def post_locals(content, title, name, id, memorial_id, likes)
    {post_content: content, post_title: title, name: name, post_id: id, memorial_id: memorial_id, likes: likes}
  end

  def image_locals(image_text, image, id, name, memorial_id, likes)
    {image_text: image_text, image: image, name: name, image_id: id, memorial_id: memorial_id, likes: likes}
  end

  def create_locals(content, memorial)
    if content.class == Story
      locals = story_locals(content.story, content.user.name, content.id, memorial.id, content.storylikes)
    elsif content.class == Post
      locals = post_locals(content.content, content.title, content.user.name, content.id, @memorial_page.memorial.id, [])
    elsif content.class == Image
      locals = image_locals(content.subtitle, content.image, content.id, content.user.name, memorial.id, [])
    end
  end
end
