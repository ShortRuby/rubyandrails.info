require "application_system_test_case"

class AuthorsTest < ApplicationSystemTestCase
  attr_reader :author

  def setup
    @author = authors(:john_doe)
  end

  test "should display the title" do
    visit authors_url

    assert_selector "h1", text: "People"
  end

  test "should display author details" do
    visit author_url(author)

    assert_selector 'h1', text: author.name
  end

  test "should search authors with search term" do
    visit authors_url
    assert_selector "h1", text: "People"

    assert_selector "h3", text: author.name

    search_with_term(author.name)
    assert_equal true, page.has_content?("Search Term: #{author.name}")

    assert_selector "h3", text: author.name
  end

  test "should not show invalid results" do
    visit authors_url
    assert_selector "h1", text: "People"

    assert_selector "h3", text: author.name

    search_with_term('invalid')
    assert_equal true, page.has_content?("Search Term: invalid")

    # Page should not have that author
    refute_selector "h3", text: author.name
  end
end
