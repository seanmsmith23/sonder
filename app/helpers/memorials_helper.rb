module MemorialsHelper

  def story_locals(story, name, id, memorial_id, likes)
    {story_text: story, name: name, story_id: id, memorial_id: memorial_id, likes: likes}
  end

  def post_locals(content, title, name, id, memorial_id, likes)
    {post_content: content, post_title: title, name: name, post_id: id, memorial_id: memorial_id, likes: likes}
  end
end
