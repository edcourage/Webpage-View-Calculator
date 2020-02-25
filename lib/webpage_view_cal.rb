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

  def self.list_by_both_unique_views_and_most_views(file_path:, display: Display)
    display.render_list({
      webpage_by_most_views: log_parser(file_path).transform_values { |v| v.count },
      webpage_by_most_unique_views: log_parser(file_path).transform_values { |v| v.uniq.count }
      })
  end

  def self.average_page_views(file_path:, display: Display)
    parsed_log_hash = log_parser(file_path)
    parsed_log_hash.each do |page_name, ip_address_array|
      parsed_log_hash[page_name] = ip_address_array.count / ip_address_array.uniq.count
    end

    display.render_list({webpage_by_most_unique_views: parsed_log_hash})
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
