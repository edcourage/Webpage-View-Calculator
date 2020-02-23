class Display
  def self.render_list(hash_for_rendering)
    hash_for_rendering.each do |list_type, pages_and_view_count|
      puts "** Webpages By Most Viewed **"
      pages_and_view_count.sort_by {|k, v| -v}.each do |page_name, view_count|
        puts "#{page_name} || Views: #{view_count}"
      end
    end
    nil
  end
end
