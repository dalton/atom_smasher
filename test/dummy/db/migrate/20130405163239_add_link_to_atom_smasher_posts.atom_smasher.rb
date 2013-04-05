# This migration comes from atom_smasher (originally 20130404120536)
class AddLinkToAtomSmasherPosts < ActiveRecord::Migration
  def change
    add_column :atom_smasher_posts, :link, :string
  end
end
