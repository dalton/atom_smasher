class CreateAtomSmasherSubscriptions < ActiveRecord::Migration
  def change
    create_table :atom_smasher_subscriptions do |t|
      t.integer :reader_id
      t.integer :feed_id

      t.timestamps
    end
  end
end
