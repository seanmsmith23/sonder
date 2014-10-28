module MemorialsHelper
  def user_is_creator_or_admin?(creator, memorial)
    current_user.is_administrator?(memorial) || user_is_creator?(creator)
  end

  def user_is_creator?(creator)
    creator.id == current_user.id
  end
end