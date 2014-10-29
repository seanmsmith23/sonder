module MemorialsHelper
  def user_is_creator_or_admin?(creator, memorial)
    user_is_admin?(memorial) || user_is_creator?(creator)
  end

  def user_is_creator?(creator)
    creator.id == current_user.id
  end

  def user_is_admin_not_creator?(memorial, creator)
    user_is_admin?(memorial) == true && user_is_creator?(creator) == false
  end

  def user_is_admin?(memorial)
    current_user.is_administrator?(memorial)
  end
end