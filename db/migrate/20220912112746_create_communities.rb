class CreateCommunities < ActiveRecord::Migration[7.0]
  def change
    create_table :communities do |t|
      t.string :title
      t.string :cover
      t.string :description

      t.timestamps
    end
  end
end
