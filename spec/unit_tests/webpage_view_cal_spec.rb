require "webpage_view_cal"

describe WebpageViewCal do

  context "#by_most_views" do
    # by default this method does not return anything. It call a display class method with the correct argument.
    # My tests will reflect that

    it "it parses a log file and creates a hash" do
      display = double 'display'
      expect(display).to receive(:render_list).with({ webpage_by_most_views: { "/help_page/1" => 1 } })
      WebpageViewCal.by_most_views(file_path: 'resources/test_resources/help_page_one_line.log',
      display: display)
    end
  end

end
