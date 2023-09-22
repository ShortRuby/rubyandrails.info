require "application_system_test_case"

class NewslettersTest < ApplicationSystemTestCase
  attr_reader :newsletter

  def setup
    @newsletter = newsletters(:one)
  end

  test "should display the title" do
    visit newsletters_url
  
    assert_selector "h1", text: "Newsletters about Ruby and Ruby on Rails"
  end

  test "should display newsletter details" do
    visit newsletter_url(newsletter)
    
    assert_selector 'h1', text: newsletter.title
  end

  test "should search Newsletter with search term" do
    visit newsletters_url
    assert_selector "h1", text: "Newsletters about Ruby and Ruby on Rails"

    assert_selector "h3", text: newsletter.title

    search_with_term(newsletter.title)
    assert_equal true, page.has_content?("Search Term: #{newsletter.title}")

    assert_selector "h3", text: newsletter.title
  end

  test "should not show invalid results" do
    visit newsletters_url
    assert_selector "h1", text: "Newsletters about Ruby and Ruby on Rails"

    assert_selector "h3", text: newsletter.title

    search_with_term('invalid')
    assert_equal true, page.has_content?("Search Term: invalid")

    # Page should not have that newsletter
    refute_selector "h3", text: newsletter.title
  end
end
