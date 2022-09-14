class CreateYoutubes < ActiveRecord::Migration[7.0]
  def change
    create_table :youtubes do |t|
      t.string :title
      t.string :cover
      t.string :description
      t.string :url

      t.timestamps
    end
  end
end
