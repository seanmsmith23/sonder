def clear_seeds
  User.destroy_all
  Memorial.destroy_all
  Membership.destroy_all
  Story.destroy_all
  Storylike.destroy_all
end

def create_user(name)
  names = name.split(' ')
  first = names[0].downcase
  last = names[1].downcase

  User.create!(first_name: first, last_name: last, email: "#{first}#{last}@example.com", password: "1")
end

def create_membership(user_id, memorial_id)
  Membership.create!(user_id: user_id, memorial_id: memorial_id)
end

def create_story(user_id,memorial_id, story)
  Story.create!(user_id: user_id, memorial_id: memorial_id, story: story)
end

def create_post(user_id, memorial_id, title, content)
  Post.create!(user_id: user_id, memorial_id: memorial_id, title: title, content: content)
end