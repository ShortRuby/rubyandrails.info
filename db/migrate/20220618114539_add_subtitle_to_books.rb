class AddSubtitleToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :subtitle, :string
  end
end
