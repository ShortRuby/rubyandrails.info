class AddSlugToYoutubes < ActiveRecord::Migration[7.0]
  def change
    add_column :youtubes, :slug, :string
    add_index :youtubes, :slug, unique: true
  end
end
