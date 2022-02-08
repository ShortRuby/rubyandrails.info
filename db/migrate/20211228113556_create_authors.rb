class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.text :content
      t.string :twitterUrl
      t.string :githubUrl
      t.string :siteUrl

      t.timestamps
    end
  end
end
