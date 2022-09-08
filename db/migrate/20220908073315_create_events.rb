class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.string :date
      t.string :url
      t.boolean :active

      t.timestamps
    end
  end
end
