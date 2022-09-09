class AddPhotoToAuthors < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :photo, :string
  end
end
