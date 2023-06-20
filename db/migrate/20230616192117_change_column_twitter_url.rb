class ChangeColumnTwitterUrl < ActiveRecord::Migration[7.0]
  def change
    rename_column :authors, :twitterUrl, :twitter_url
  end
end
