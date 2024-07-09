module ApplicationHelper
  def join_tags
    tags.map { |it| it.name }.join(', ')
  end

end
