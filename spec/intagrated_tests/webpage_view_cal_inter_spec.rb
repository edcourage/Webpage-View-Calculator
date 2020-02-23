require "webpage_view_cal"

describe "Intagrated Tests" do
  context "cal by most views" do
    it "will puts the correct list" do
      path = 'resources/test_resources/different_pages_multiple_views_each.log'
      expect { WebpageViewCal.by_most_views(file_path: path) }.to output(
        "** Webpages By Most Viewed **\n/help_page/1 || Views: 3\n/contact || Views: 2\n/about/2 || Views: 1\n").to_stdout
    end
  end
end
