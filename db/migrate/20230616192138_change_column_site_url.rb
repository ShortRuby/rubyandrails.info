class ChangeColumnSiteUrl < ActiveRecord::Migration[7.0]
  def change
    rename_column :authors, :siteUrl, :website_url
  end
end
