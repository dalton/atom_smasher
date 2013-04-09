require 'spec_helper'
describe "Readers" do
  describe "GET /atom_smasher/feeds" do
    it "displays all the feeds the reader subscribes to" do
      reader = User.create!(name: "Atom Smasher")
      subscribed_feed = AtomSmasher::Feed.create!(url: "#{File.dirname(__FILE__)}/../fixtures/previous_episodes.xml")
      reader.feeds << subscribed_feed
      unsubscribed_feed = AtomSmasher::Feed.create!(url: "#{File.dirname(__FILE__)}/../fixtures/current_episodes.xml")
      visit feeds_path
      click_link subscribed_feed.title
      page.should have_content "Guest User Record"
      page.should_not have_content unsubscribed_feed.title
    end
  end
end