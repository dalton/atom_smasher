# This migration comes from atom_smasher (originally 20130403191447)
class CreateAtomSmasherPosts < ActiveRecord::Migration
  def change
    create_table :atom_smasher_posts do |t|
      t.integer :feed_id
      t.text :content
      t.string :title

      t.timestamps
    end
  end
end
