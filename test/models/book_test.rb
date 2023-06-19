# == Schema Information
#
# Table name: books
#
#  id                 :bigint           not null, primary key
#  title              :string
#  content            :text
#  free               :boolean
#  page               :integer
#  isbn               :string
#  amazon_url         :string
#  website_title      :string
#  website_url        :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  subtitle           :string
#  year               :integer
#  slug               :string
#  cover              :string
#  featured           :boolean
#
require "test_helper"

class BookTest < ActiveSupport::TestCase
  attr_reader :book

  def setup
    @book = books(:ror_interview_bible)
  end

  test "should be valid" do
    assert book.valid?
  end

  test "should have a title" do
    book.title = ""
    assert_not book.valid?
  end

  test "should have content" do
    book.content = ""
    assert_not book.valid?
  end

  test "should have a friendly_id" do
    assert_respond_to book, :slug
  end

  test "should return free books" do
    assert_includes Book.free_books, book
  end

  test "should have next book" do
    assert_equal books(:two), book.next
  end

  test "should have previous book" do
    assert_equal books(:two), book.previous
  end
end
