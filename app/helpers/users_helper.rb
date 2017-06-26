module UsersHelper
  
  BACKGROUND_COLORS = %w(pink red blue orange-light green pink-dark purple-dark orange)
  
  def link_to_user(user, options = {})
    link_to user.name(options[:name_format]), user_path(user)
  end
  
  def link_to_user_avatar(user, options = {})
    link_to user_avatar(user, options), user_path(user), class: 'no-text-decoration'
  end
  
  def user_avatar(user, options = {})
    options[:content] ||= user.initials
    
    options[:img_url] ||= user.avatar_img(options[:size])
    options[:index]   ||= user.id
    options[:title]   ||= user.name # if title_true
    
    circle options
  end
  
  def user_avatar_collection(user_collection)
    collection_size = user_collection.size
    user_count    = collection_size <= 3 ? collection_size : 2
    
    output = ''
    
    user_collection.first(user_count).each do |u|
      output << user_avatar(u.user)
    end
    output << circle(content: "+#{collection_size - 2}") if collection_size > 3
    
    output.html_safe
  end
  
  # circle_tag(content: "NL", size: "medium", img_url: ..., index: 7, img_without_content: true, title: "Neal Loner")
  def circle(options = {})
    html_options = {}
    
    if options[:title]
      html_options['data-toggle']    = 'tooltip'
      html_options['data-placement'] = 'bottom'
      html_options[:title]           = options[:title]
    end
    
    options[:size]          ||= :medium
    options[:colors]        ||= BACKGROUND_COLORS
    options[:content_size]  ||= options[:size]
    content = circle_content(options[:content], options[:content_size]) if options[:content]
    
    html_options[:class] = "circle"
    html_options[:class] << " circle-#{options[:size]}" if options[:size]
    html_options[:class] << " circle-bg-#{circle_background_color(options[:index], options[:colors])}" unless options[:img_url]
    html_options[:class] << " #{options[:class]}" if options[:class]
    
    content_tag :div, html_options do
      options[:img_url] ? image_tag(options[:img_url]) : content
    end
  end
    
  # <tt>:size</tt>
  def circle_content(content, size = nil)
    classes = 'circle-content'
    classes << " circle-content-#{size}" if size
    content_tag :span, content, class: classes
  end
  
  # def circle_optional_content(content)
  #   classes = 'circle-optional-content'
  #   content_tag :span, content, class: classes
  # end
  
  def circle_background_color(index, colors)
    return "gray" unless index
    i = 0
    colors.cycle do |color|
      return color if i == index
      i += 1
    end
  end
end
