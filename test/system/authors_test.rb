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
end
