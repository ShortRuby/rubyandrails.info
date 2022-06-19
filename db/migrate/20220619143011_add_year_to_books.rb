class AddYearToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :year, :integer
  end
end
