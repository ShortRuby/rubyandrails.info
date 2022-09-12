class AddSourcesToCommunities < ActiveRecord::Migration[7.0]
  def change
    add_column :communities, :source, :integer
  end
end
