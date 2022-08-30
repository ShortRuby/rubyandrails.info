class AddCoverToCourses < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :cover, :string
  end
end
