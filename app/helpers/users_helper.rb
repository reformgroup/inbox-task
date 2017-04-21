module UsersHelper
  
  def link_to_user(user, content_type = nil)
    avatar    = link_to(image_tag(user.avatar.url(:medium), class: 'avatar avatar-medium'), user_path(user))
    user_name = link_to(user.name, user_path(team_user.user))
  end
end
