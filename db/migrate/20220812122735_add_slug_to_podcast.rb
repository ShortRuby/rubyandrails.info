class AddSlugToPodcast < ActiveRecord::Migration[7.0]
  def change
    add_column :podcasts, :slug, :string
    add_index :podcasts, :slug, unique: true
  end
end
