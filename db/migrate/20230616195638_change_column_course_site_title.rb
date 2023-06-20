class ChangeColumnCourseSiteTitle < ActiveRecord::Migration[7.0]
  def change
    rename_column :courses, :courseSiteTitle, :website_title
  end
end
