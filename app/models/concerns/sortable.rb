require 'active_support/concern'

module Sortable
  
  extend ActiveSupport::Concern

  class_methods do
    
    # Returns a sorted collection.
    def sorting(column_param, direction_param = nil)
      column    = sort_column column_param
      direction = sort_direction direction_param
      self.order("#{column} #{direction}") if column && direction
    end
    
    private
  
    def sort_column(column_param)
      if column_param && self.column_names.include?(column_param)
        column_param
      else
        default_sort_columns.each do |column|
          return column if self.column_names.include?(column)
        end
      end
    end

    def sort_direction(direction_param = nil)
      %w(asc desc).include?(direction_param) ? direction_param : 'asc'
    end
    
    def default_sort_columns
      %w(name last_name created_at)
    end
  end
end