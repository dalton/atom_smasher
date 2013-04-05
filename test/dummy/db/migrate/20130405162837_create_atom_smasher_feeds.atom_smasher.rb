# This migration comes from atom_smasher (originally 20130403174525)
class CreateAtomSmasherFeeds < ActiveRecord::Migration
  def change
    create_table :atom_smasher_feeds do |t|
      t.string :url

      t.timestamps
    end
  end
end
