require 'rails_helper'

describe Memorial do
  it "should only return content from users with permission to view the memorial" do
    user = create_user
    memorial = create_memorial(user_id: user.id)
    memorial2 = create_memorial(user_id: user.id)
    post = create_post(user_id: user.id, memorial_id: memorial.id)
    story = create_story(user_id: user.id, memorial_id: memorial.id)
    story2 = create_story(user_id: user.id, memorial_id: memorial2.id)
    create_post(user_id: user.id, memorial_id: memorial2.id)
    membership = create_membership(user, memorial)

    expect(memorial.allowed_stories.count).to eq(1)
    expect(memorial.allowed_posts.count).to eq(1)
    expect(memorial.allowed_posts.first.content).to eq(post.content)
    expect(memorial.allowed_stories.first.story).to eq(story.story)

    membership.update(permission: false)

    expect(memorial.allowed_posts.count).to eq(0)
    expect(memorial.allowed_stories.count).to eq(0)
  end
end