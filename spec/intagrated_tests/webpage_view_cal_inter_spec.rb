require "webpage_view_cal"

describe "Intagrated Tests" do
  context "cal by most views" do
    it "will puts the correct list" do
      path = 'resources/test_resources/different_pages_multiple_views_each.log'
      expect { WebpageViewCal.by_most_views(file_path: path) }.to output(
        "** Webpages By Most Viewed **\n/help_page/1 || Views: 3\n/contact || Views: 2\n/about/2 || Views: 1\n").to_stdout
    end
  end

  context "most unique views" do
    it "will puts correct list with correct title" do
      path = 'resources/test_resources/different_pages_multiple_views_each.log'
      expect { WebpageViewCal.by_most_unique_views(file_path: path) }.to output(
        "** Webpages By Most Unique Views **\n/help_page/1 || Views: 2\n/contact || Views: 1\n/about/2 || Views: 1\n").to_stdout
    end
  end

  context "list_by_both_unique_views_and_most_views" do
    it "will puts correct list with correct title" do
      path = 'resources/test_resources/different_pages_multiple_views_each.log'
      expect { WebpageViewCal.list_by_both_unique_views_and_most_views(file_path: path) }.to output(
        "** Webpages By Most Viewed **\n/help_page/1 || Views: 3\n/contact || Views: 2\n/about/2 || Views: 1\n** Webpages By Most Unique Views **\n/help_page/1 || Views: 2\n/contact || Views: 1\n/about/2 || Views: 1\n").to_stdout
    end
  end
end
