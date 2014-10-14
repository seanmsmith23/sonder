def create_user(overrides = {})
  num = rand(1000)
  defaults = {
    first_name: "Example#{num}",
    last_name: "User",
    email: "example#{num}@user.com",
    password: "1"
  }

  User.create!(defaults.merge(overrides))
end

def create_memorial(overrides = {})
  num = rand(1000)
  defaults = {
    name: "Example#{num} Whodied",
    born: 30.years.ago,
    died: 5.days.ago,
    user_id: 1,
  }

  Memorial.create!(defaults.merge(overrides))
end

def create_story(overrides = {})
  defaults = {
    user_id: 1,
    story: "I remember that time he ate a boiled turtle",
    memorial_id: 1
  }

  Story.create!(defaults.merge(overrides))
end

def create_membership(user, memorial)
  Membership.create!(user: user, memorial: memorial)
end

def signout
  visit '/signout'
end