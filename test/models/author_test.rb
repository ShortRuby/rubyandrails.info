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
  attr_reader :author

  def setup
    @author = authors(:john_doe)
  end

  test 'should be valid' do
    assert author.valid?
    assert_empty author.errors
  end

  test "should have a friendly_id" do
    assert_not_nil author.slug
  end

  test "should have many books" do
    assert_instance_of Book, author.books.new
  end

  test "should have many courses" do
    assert_instance_of Course, author.courses.new
  end

  # Add similar tests for other associations

  test "should have rich text content" do
    assert_respond_to author, :content
    assert_instance_of ActionText::RichText, author.content
  end

  test "should be searchable by id and name" do
    assert_includes Author.ransackable_attributes, "id"
    assert_includes Author.ransackable_attributes, "name"
  end
end
