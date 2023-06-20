class ChangeColumnGetBookOnSiteUrl < ActiveRecord::Migration[7.0]
  def change
    rename_column :books, :getBookOnSiteUrl, :website_url
  end
end
