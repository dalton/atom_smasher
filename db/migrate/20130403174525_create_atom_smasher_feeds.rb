class CreateAtomSmasherFeeds < ActiveRecord::Migration
  def change
    create_table :atom_smasher_feeds do |t|
      t.string :url

      t.timestamps
    end
  end
end
