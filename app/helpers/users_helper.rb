module UsersHelper
  
  def link_to_user(user, options = {})
    output = ''
    output << link_to(image_tag(user.avatar.url(:medium), class: 'avatar avatar-medium mr-2'), user_path(user)) unless options[:only_name]
    output << link_to(user.name(options[:name_format]), user_path(user)) unless options[:only_avatar]
    content_tag :div, output.html_safe
  end
end
