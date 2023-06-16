# == Schema Information
#
# Table name: authors
#
#  id           :bigint           not null, primary key
#  name         :string
#  content      :text
#  twitter_url  :string
#  github_url   :string
#  website_url  :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  slug         :string
#  photo        :string
#  mastodon_url :string
#
require "test_helper"

class AuthorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
