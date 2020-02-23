require_relative "display"

class WebpageViewCal
  def self.by_most_views(file_path:, display: Display)
    calculated_most_views = Hash.new { |hash, key| hash[key] = [] }
    File.open(file_path).each_line do |line|
      page_name = line.split(" ")[0]
      ip_address = line.split(" ")[1]
      calculated_most_views[page_name] << ip_address
    end
    display.render_list({ webpage_by_most_views: calculated_most_views.transform_values(&:count) })
  end
end
