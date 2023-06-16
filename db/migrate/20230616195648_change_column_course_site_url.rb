class ChangeColumnCourseSiteUrl < ActiveRecord::Migration[7.0]
  def change
    rename_column :courses, :courseSiteUrl, :website_url
  end
end
