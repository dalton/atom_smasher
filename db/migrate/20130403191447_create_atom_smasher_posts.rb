class CreateAtomSmasherPosts < ActiveRecord::Migration
  def change
    create_table :atom_smasher_posts do |t|
      t.integer :feed_id
      t.string :title
      t.string :link
      t.string :link_alternate
      t.string :link_self
      t.string :link_edit
      t.string :link_replies
      t.string :author
      t.string :contributor
      t.string :description
      t.string :summary
      t.string :content
      t.string :content_encoded
      t.string :comments
      t.string :pubDate
      t.string :published
      t.string :updated
      t.string :expirationDate
      t.string :modified
      t.string :dc_date
      t.string :category
      t.string :guid
      t.string :trackback_ping
      t.string :trackback_about
      t.string :dc_creator
      t.string :dc_title
      t.string :dc_subject
      t.string :dc_rights
      t.string :dc_publisher
      t.string :feedburner_origLink
      t.string :media_content_url
      t.string :media_content_type
      t.string :media_content_height
      t.string :media_content_width
      t.string :media_title
      t.string :media_thumbnail_url
      t.string :media_thumbnail_height
      t.string :media_thumbnail_width
      t.string :media_credit
      t.string :media_credit_role
      t.string :media_category
      t.string :media_category_scheme

      t.timestamps
    end
  end
end
