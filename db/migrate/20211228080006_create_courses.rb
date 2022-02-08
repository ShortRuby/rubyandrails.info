class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :content
      t.boolean :free
      t.string :courseSiteTitle
      t.string :courseSiteUrl

      t.timestamps
    end
  end
end
