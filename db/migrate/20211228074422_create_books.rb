class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :content
      t.boolean :free
      t.integer :page
      t.string :isbn
      t.string :getBookOnAmazonUrl
      t.string :getBookOnSiteTitle
      t.string :getBookOnSiteUrl

      t.timestamps
    end
  end
end
