class AddLinkToAtomSmasherPosts < ActiveRecord::Migration
  def change
    add_column :atom_smasher_posts, :link, :string
  end
end
