require "webpage_view_cal"

describe WebpageViewCal do

  let(:display) { double 'display' }

  context "#by_most_views" do
    # This method does not return anything. It call a display class method with the correct argument.
    # My tests will reflect that

    it "it parses a log file and creates a hash" do
      expect(display).to receive(:render_list).with({ webpage_by_most_views: { "/help_page/1" => 1 } })
      WebpageViewCal.by_most_views(file_path: 'resources/test_resources/help_page_one_view.log',
      display: display)
    end

    it "if the log file indecates two view that will be represented" do
      expect(display).to receive(:render_list).with({ webpage_by_most_views: { "/help_page/1" => 2 } })
      WebpageViewCal.by_most_views(file_path: 'resources/test_resources/help_page_two_views.log',
      display: display)
    end

    it "if the log file indecates different pages with different amounts of view each that will be represented" do
      expected_hash = {
        "/about/2" => 1,
        "/help_page/1" => 3,
        "/contact" => 2,
      }
      expect(display).to receive(:render_list).with({ webpage_by_most_views: expected_hash })
      WebpageViewCal.by_most_views(file_path: 'resources/test_resources/different_pages_multiple_views_each.log',
      display: display)
    end
  end

  context "#by_most_unique_views" do
    # Again this method does not return anything. It call a display class method with the correct argument.
    # My tests will reflect that
    it "should only count unique views" do
      expect(display).to receive(:render_list).with({ webpage_by_most_unique_views: { "/help_page/1" => 1 } })
      WebpageViewCal.by_most_unique_views(file_path: 'resources/test_resources/help_page_two_views.log',
      display: display)
    end

    # THIS TEST IS KIND OF USELESS......
    it "should still return unique values if it get multiple pages and views" do
      expected_hash = {
        "/about/2" => 1,
        "/help_page/1" => 2,
        "/contact" => 1,
      }
      expect(display).to receive(:render_list).with({ webpage_by_most_unique_views: expected_hash })
      WebpageViewCal.by_most_unique_views(file_path: 'resources/test_resources/different_pages_multiple_views_each.log',
      display: display)
    end
  end

  context "#list by both unique views and most views" do
    it "should call display class with hash containing both unique views and mosts views" do
      expected_unique_views_hash = {
        "/about/2" => 1,
        "/help_page/1" => 2,
        "/contact" => 1,
      }
      expected_total_views_hash = {
        "/about/2" => 1,
        "/help_page/1" => 3,
        "/contact" => 2,
      }
      expect(display).to receive(:render_list).with({
        webpage_by_most_views: expected_total_views_hash,
        webpage_by_most_unique_views: expected_unique_views_hash
      })
      WebpageViewCal.list_by_both_unique_views_and_most_views(file_path: 'resources/test_resources/different_pages_multiple_views_each.log',
      display: display)
    end
  end

end
