module AncestryHelper
  # arranged as tree expects 3 arguments. The hash from has_ancestry.arrange() method, 
  # options, and a render block
  def arranged_tree(hash, options = {}, &block)
    options[:collapse]       ||= false
    options[:collapse_show]  ||= true
    html_options             = {}
    output                   = ''
    
    hash.each do |object, children|
      html_options[:collapse_id] = "parent-#{object.class.name.demodulize.tableize.dasherize}-#{object.id}" if options[:collapse] && children.size > 0
      html_options[:collapse_caret_class] = options[:collapse_caret_class]
      
      output << capture(object, html_options, &block)
      
      if children.size > 0
        html_options[:class] = 'sub-media'
        
        if options[:collapse]
          html_options[:class] << ' collapse'
          html_options[:class] << ' in' if options[:collapse_show]
          html_options[:id] = html_options.delete(:collapse_id)
        end
          
        output << content_tag(:div, html_options.slice(:id, :class)) do
          arranged_tree(children, options, &block).html_safe
        end
      end
    end
    
    output.html_safe
  end
  
  def arranged_tree_item(hash, &block)
  end
end