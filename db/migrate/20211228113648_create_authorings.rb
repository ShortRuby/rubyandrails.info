class CreateAuthorings < ActiveRecord::Migration[7.0]
  def change
    create_table :authorings do |t|
      t.references :author, null: false, foreign_key: true
      t.references :authorabble, polymorphic: true, null: false

      t.timestamps
    end
  end
end
