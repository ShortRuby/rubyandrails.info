require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  attr_reader :book

  def setup
    @book = books(:ror_interview_bible)
  end

  test "visiting the index" do
    visit books_path
    assert_selector "h1", text: "Books about Ruby and Ruby on Rails"
  end

  test "should display book details" do
    visit book_url(book)
    
    assert_selector 'h1', text: book.title
  end
end
