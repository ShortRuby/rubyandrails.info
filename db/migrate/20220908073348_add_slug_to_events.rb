class AddSlugToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :slug, :string
    add_index :events, :slug, unique: true
  end
end
