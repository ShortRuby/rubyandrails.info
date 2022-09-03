class CreateScreencasts < ActiveRecord::Migration[7.0]
  def change
    create_table :screencasts do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
