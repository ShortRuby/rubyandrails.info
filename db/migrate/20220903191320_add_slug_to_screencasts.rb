class AddSlugToScreencasts < ActiveRecord::Migration[7.0]
  def change
    add_column :screencasts, :slug, :string
    add_index :screencasts, :slug, unique: true
  end
end
