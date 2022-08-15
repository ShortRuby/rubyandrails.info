class AddFeaturedToPodcasts < ActiveRecord::Migration[7.0]
  def change
    add_column :podcasts, :featured, :boolean
  end
end
