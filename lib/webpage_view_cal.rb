class WebpageViewCal

  def self.by_most_views(file_path:, display: Display)
    calculated_most_views = Hash.new(0)
    File.open(file_path).each_line do |line|
      page_name = line.split(" ")[0]
      calculated_most_views[page_name] += 1
    end
    display.render_list({ webpage_by_most_views: calculated_most_views })
  end

end
