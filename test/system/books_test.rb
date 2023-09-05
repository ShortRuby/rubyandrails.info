require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  attr_reader :book

  def setup
    @book = books(:ror_interview_bible)
  end

  test "should display the title" do
    visit books_path
    assert_selector "h1", text: "Books about Ruby and Ruby on Rails"
  end

  test "should display book details" do
    visit book_url(book)
    
    assert_selector 'h1', text: book.title
  end

  test "should search books with search term" do
    visit books_path
    assert_selector "h1", text: "Books about Ruby and Ruby on Rails"

    assert_selector "h2", text: book.title

    serach_book_title(book.title)
    assert_equal true, page.has_content?("Search Term: #{book.title}")

    assert_selector "h2", text: book.title
  end

  test "should not show invalid results" do
    visit books_path
    assert_selector "h1", text: "Books about Ruby and Ruby on Rails"

    assert_selector "h2", text: book.title

    serach_book_title('invalid')
    assert_equal true, page.has_content?("Search Term: invalid")

    # Page should not have that book
    refute_selector "h2", text: book.title
  end

  private

  def serach_book_title(title)
    fill_in 'search_term', with: title
    click_button 'Search'
  end
end
