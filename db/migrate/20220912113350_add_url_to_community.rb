class AddUrlToCommunity < ActiveRecord::Migration[7.0]
  def change
    add_column :communities, :url, :string
  end
end
