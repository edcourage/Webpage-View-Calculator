require "display"

describe Display do
  context "#render_list" do
    it "it will render a single item with the correct title" do
      expect { Display.render_list({ webpage_by_most_views: { "/help_page/1" => 2 } }) }.to output(
        "** Webpages By Most Viewed **\n/help_page/1 || Views: 2\n").to_stdout
    end

    it "it will return list multiple items in order of view count" do
      expect { Display.render_list({ webpage_by_most_views: { "/help_page/1" => 2, "/contact" => 4, "/about/2" => 1 } }) }.to output(
        "** Webpages By Most Viewed **\n/contact || Views: 4\n/help_page/1 || Views: 2\n/about/2 || Views: 1\n").to_stdout
    end

    it "the list title will change depending on the type of list" do
      expect { Display.render_list({ webpage_by_most_unique_views: { "/help_page/1" => 2, "/contact" => 4, "/about/2" => 1 } }) }.to output(
        "** Webpages By Most Unique Views **\n/contact || Views: 4\n/help_page/1 || Views: 2\n/about/2 || Views: 1\n").to_stdout
    end

  end
end
