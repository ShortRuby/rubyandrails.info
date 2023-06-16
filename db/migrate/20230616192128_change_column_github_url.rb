class ChangeColumnGithubUrl < ActiveRecord::Migration[7.0]
  def change
    rename_column :authors, :githubUrl, :github_url
  end
end
