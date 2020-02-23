require "display"

describe Display do
  context "#render_list" do
    it "it will render a single item with the correct title" do
      expect { Display.render_list({ webpage_by_most_views: { "/help_page/1" => 2 } }) }.to output(
        "** Webpages By Most Viewed **\n/help_page/1 || Views: 2\n").to_stdout
    end
  end
end
