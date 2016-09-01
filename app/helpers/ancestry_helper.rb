module AncestryHelper
  # arranged as tree expects 3 arguments. The hash from has_ancestry.arrange() method, 
  # options, and a render block
  def arranged_tree(hash, options = {}, &block)
    options[:collapse]        ||= false
    options[:collapse_hidden] ||= false
    item_options  = options
    output        = ''
    
    hash.each do |object, children|
      item_options[:collapse_id] = "parent-#{object.class.name.demodulize.tableize.dasherize}-#{object.id}" if item_options[:collapse] && children.size > 0
      
      output << capture(object, item_options, &block)
      
      if children.size > 0
        subtree_class = 'sub-media'
        
        if item_options[:collapse]
          subtree_class << ' collapse'
          subtree_class << ' in' unless item_options[:collapse_hidden]
          subtree_id = item_options.delete(:collapse_id)
        end
        
        output << content_tag(:div, id: subtree_id, class: subtree_class) do
          arranged_tree(children, item_options, &block)
        end
      end
    end
    
    output.html_safe
  end
end