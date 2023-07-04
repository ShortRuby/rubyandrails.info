require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:ror_interview_bible)
  end

  test "visiting the index" do
    visit books_path
    assert_selector "h1", text: "Books about Ruby and Ruby on Rails"
  end
end
