class AddFeaturedToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :featured, :boolean
  end
end
