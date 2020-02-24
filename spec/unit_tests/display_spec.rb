require "display"

describe Display do
  context "#render_list" do
    it "will render a single item with the correct title" do
      expect { Display.render_list({ webpage_by_most_views: { "/help_page/1" => 2 } }) }.to output(
        "** Webpages By Most Viewed **\n/help_page/1 || Views: 2\n").to_stdout
    end

    it "will return list multiple items in order of view count" do
      expect { Display.render_list({ webpage_by_most_views: { "/help_page/1" => 2, "/contact" => 4, "/about/2" => 1 } }) }.to output(
        "** Webpages By Most Viewed **\n/contact || Views: 4\n/help_page/1 || Views: 2\n/about/2 || Views: 1\n").to_stdout
    end

    it "the list title will change depending on the type of list" do
      expect { Display.render_list({ webpage_by_most_unique_views: { "/help_page/1" => 2, "/contact" => 4, "/about/2" => 1 } }) }.to output(
        "** Webpages By Most Unique Views **\n/contact || Views: 4\n/help_page/1 || Views: 2\n/about/2 || Views: 1\n").to_stdout
    end

    it "if the hash contains two lists they will both be rendered" do
      lists_hash = {
        webpage_by_most_views: { "/help_page/1" => 3, "/contact" => 2, "/about/2" => 1 },
        webpage_by_most_unique_views: { "/help_page/1" => 2, "/contact" => 1, "/about/2" => 1 }
      }
      expect { Display.render_list(lists_hash) }.to output(
        "** Webpages By Most Viewed **\n/help_page/1 || Views: 3\n/contact || Views: 2\n/about/2 || Views: 1\n** Webpages By Most Unique Views **\n/help_page/1 || Views: 2\n/contact || Views: 1\n/about/2 || Views: 1\n").to_stdout
    end
  end
end
