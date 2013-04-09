require 'spec_helper'

class AtomSmasher::Feed
  def item_content(item)
    "ipsum lorem"
  end
end
describe "Readers" do
  describe "GET /atom_smasher/feeds" do
    it "displays all the feeds the reader subscribes to" do
      reader = User.create!(name: "Atom Smasher")
      subscribed_feed = AtomSmasher::Feed.create!(url: "./spec/fixtures/previous_episodes.xml")
      subscribed_feed.get_info_from_stream
      reader.feeds << subscribed_feed
      unsubscribed_feed = AtomSmasher::Feed.create!(url: "./spec/fixtures/current_episodes.xml")
      unsubscribed_feed.get_info_from_stream
      visit feeds_path
      click_link subscribed_feed.title
      page.should have_content "Guest User Record"
      page.should_not have_content unsubscribed_feed.title
    end
  end
end