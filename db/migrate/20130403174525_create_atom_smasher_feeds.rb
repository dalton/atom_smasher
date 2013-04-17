class CreateAtomSmasherFeeds < ActiveRecord::Migration
  def change
    create_table :atom_smasher_feeds do |t|
      t.string :url
      t.string :title
      t.string :subtitle
      t.string :description
      t.string :author
      t.string :webMaster
      t.string :managingEditor
      t.string :contributor
      t.string :pubDate
      t.string :lastBuildDate
      t.string :updated
      t.string :dc_date
      t.string :generator
      t.string :language
      t.string :docs
      t.string :cloud
      t.string :ttl
      t.string :skipHours
      t.string :skipDays
      t.string :image
      t.string :logo
      t.string :icon
      t.string :rating
      t.string :rights
      t.string :copyright
      t.string :textInput
      t.string :feedburner_browserFriendly
      t.string :itunes_author
      t.string :itunes_category

      t.timestamps
    end
  end
end
