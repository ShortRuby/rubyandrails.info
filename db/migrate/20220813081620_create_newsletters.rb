class CreateNewsletters < ActiveRecord::Migration[7.0]
  def change
    create_table :newsletters do |t|
      t.string :title
      t.string :url
      t.string :description
      t.string :slug
      t.boolean :featured
      t.string :author

      t.timestamps
    end
    add_index :newsletters, :slug, unique: true
  end
end
