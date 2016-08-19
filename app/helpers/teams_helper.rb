module TeamsHelper
  def nested_teams(items)
    items.map do |item, sub_items|
      render 'item', item: item, sub_items: nested_teams(sub_items)
    end.join.html_safe
  end
end