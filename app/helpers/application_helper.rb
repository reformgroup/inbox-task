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
  
  # Grid system
  def grid(prefix = nil)
    prefix || 'xl'
  end
  
  def column(col = 12)
    col || 12
  end
  
  def column_class(col = nil, prefix = nil)
    "col-#{grid(prefix)}-#{column(col)}"
  end
  
  def column_offset_class(col = nil, prefix = nil)
    "col-#{grid(prefix)}-offset-#{column(col)}"
  end
  
  def small_column_class
    column_class(3)
  end
  
  def small_column_offset_class
    column_offset_class(3)
  end
  
  def large_column_class
    column_class(9)
  end
  
  def dynamic_small_column_class
    "#{column_class(4, 'ld')} #{column_class(3)}"
  end
  
  def dynamic_small_column_offset_class
    "#{column_offset_class(4, 'ld')} #{column_offset_class(3)}"
  end
  
  def dynamic_large_column_class
    "#{column_class(8, 'ld')} #{column_class(9)}"
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
  
  # HACK: Delete if not used
  def nav_link_to(link_text, link_path)
    options = {}
    options[:class] = 'nav-item'
    if request.path == link_path.split('?')[0]
      options[:class] << ' active'
      link_text << " <span class=""sr-only"">(current)</span>"
    end
    content_tag(:li, options) { link_to(link_text.html_safe, link_path, class: 'nav-link') }
  end
end
