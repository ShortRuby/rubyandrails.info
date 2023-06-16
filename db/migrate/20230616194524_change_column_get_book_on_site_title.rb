class ChangeColumnGetBookOnSiteTitle < ActiveRecord::Migration[7.0]
  def change
    rename_column :books, :getBookOnSiteTitle, :website_title
  end
end
