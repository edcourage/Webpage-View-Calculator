class WebpageViewCal

  def self.by_most_views(file_path:, display: Display)
    calculated_most_views = {}
    wed_server_log = File.open(file_path)
    wed_server_log.each_line do |line|
      line = line.split(" ")
      calculated_most_views = { line[0] => 1 }
    end
    display.render_list({ webpage_by_most_views: calculated_most_views })
  end

end
