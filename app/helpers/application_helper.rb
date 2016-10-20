module ApplicationHelper
  
  LOCALE_LIST = { en: 'English', ru: 'Русский' }
  APP_NAME = 'Inbox task'
  
  def current_locale_name
    LOCALE_LIST[I18n.locale]
  end
  
  def locale_list
    LOCALE_LIST
  end
  
  # Returns the app name.
  def app_name
    APP_NAME
  end
  
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = app_name
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  # Uri redirections form http to https
  def process_uri(uri)
     avatar_url = URI.parse(uri)
     avatar_url.scheme = 'https'
     avatar_url.to_s
  end

  # Return time ago with full date time tooltip
  def time_ago_tag(from_time, options = {})
    return unless from_time
    
    options                   ||= {}
    options['data-toggle']    ||= 'tooltip'
    options['data-placement'] ||= 'top'
    options[:title]           ||= l(from_time, format: :long)
    
    content_tag(:span, "#{time_ago_in_words(from_time)} #{t('ago')}", options) 
  end
  
  def not_found
    raise ActionController::RoutingError.new 'Not Found'
  end
  
  def error_messages(object, method = nil)
    if method
      each_error object.errors[method]
    else
      each_error object.errors.full_messages
    end
  end
  
  def each_error(error_arr)
    if error_arr.any?
      error_content = String.new
      content_tag(:ui) do
        error_arr.each { |msg| error_content << content_tag(:li, msg, class: 'text-danger') }
      end
      error_content.html_safe
    end
  end
  
  # TODO: Delete if not used
  def nav_link_to(link_text, link_path)
    options = {}
    options[:class] = 'nav-item'
    if request.path == link_path.split('?')[0]
      options[:class] << ' active'
      link_text << " <span class=""sr-only"">(current)</span>"
    end
    content_tag(:li, options) { link_to(link_text.html_safe, link_path, class: 'nav-link') }
  end
  
  # Nested objects
  def nested_for(object, options = {}, &block)
    output = capture(&block)
    output << link_to("Remove", "javascript:void(0)", class: "remove-nested-fields", "data-object-name": object.object_name) if options[:destroy]
    
    output = content_tag(:p, output, class: "removable-nested-fields")
    output << object.hidden_field(:_destroy) if options[:destroy]
    output.html_safe
  end
  
  # Ancestry
  def ancestry_parent_breadcrumbs(object, method)
    if object.parent
      parent_tag      = link_to(object.parent.public_send(method), object.parent)
      grandparent_tag = ancestry_parent_breadcrumbs(object.parent, method)
      parent_tag      = grandparent_tag << " / " << parent_tag if grandparent_tag
      parent_tag
    end
  end
end