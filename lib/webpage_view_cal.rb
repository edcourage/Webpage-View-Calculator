require_relative "display"

class WebpageViewCal
  def self.by_most_views(file_path:, display: Display)
    display.render_list({
      webpage_by_most_views: log_parser(file_path).transform_values { |v| v.count }
      })
  end

  def self.by_most_unique_views(file_path:, display: Display)
    display.render_list({
      webpage_by_most_unique_views: log_parser(file_path).transform_values { |v| v.uniq.count }
      })
  end

  # This method returns a hash where the keys equal the page and and
  # the value is the correlating ip addresses
  def self.log_parser(file_path)
    calculated_most_views = Hash.new { |hash, key| hash[key] = [] }
    File.open(file_path).each_line do |line|
      page_name = line.split(" ")[0]
      ip_address = line.split(" ")[1]
      calculated_most_views[page_name] << ip_address
    end
    calculated_most_views
  end

  private_class_method :log_parser
end
