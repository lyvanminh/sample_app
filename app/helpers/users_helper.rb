module UsersHelper
  def gravatar_for _user
    image_tag("minh.jpg", size: Settings.users_helper.image_size)
  end
end
