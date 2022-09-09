class AddFeaturedCoverToNewsletters < ActiveRecord::Migration[7.0]
  def change
    add_column :newsletters, :featured_cover, :string
  end
end
