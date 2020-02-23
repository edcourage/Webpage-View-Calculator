class Display
  def self.render_list(hash_for_rendering)
    hash_for_rendering.each do |list_type, pages_and_view_count|
      if list_type == :webpage_by_most_views
        puts "** Webpages By Most Viewed **"
      elsif list_type == :webpage_by_most_unique_views
        puts "** Webpages By Most Unique Views **"
      end

      pages_and_view_count.sort_by { |_, v| -v }.each do |page_name, view_count|
        puts "#{page_name} || Views: #{view_count}"
      end
    end
    nil
  end
end
