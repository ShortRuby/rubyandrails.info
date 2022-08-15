class CreatePodcasts < ActiveRecord::Migration[7.0]
  def change
    create_table :podcasts do |t|
      t.string :title
      t.string :cover
      t.string :url

      t.timestamps
    end
  end
end
