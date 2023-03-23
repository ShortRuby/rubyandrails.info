class AddMastodonUrlToAuthors < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :mastodon_url, :string
  end
end
