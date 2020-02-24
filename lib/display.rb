class Display
  
  def self.render_list(hash_for_rendering)
    hash_for_rendering.each do |list_type, pages_and_view_count|
      puts list_title_selector(list_type)
      pages_and_view_count.sort_by { |_, v| -v }.each do |page_name, view_count|
        puts "#{page_name} || Views: #{view_count}"
      end
    end
    nil
  end

  def self.list_title_selector(list_type)
    if list_type == :webpage_by_most_views
      "** Webpages By Most Viewed **"
    elsif list_type == :webpage_by_most_unique_views
      "** Webpages By Most Unique Views **"
    end
  end

  private_class_method :list_title_selector
end
