require "application_system_test_case"

class NewslettersTest < ApplicationSystemTestCase
  attr_reader :newsletter

  def setup
    @newsletter = newsletters(:one)
  end

  test "visiting the index" do
    visit newsletters_url
  
    assert_selector "h1", text: "Newsletters about Ruby and Ruby on Rails"
  end

  test "should display newsletter details" do
    visit newsletter_url(newsletter)
    
    assert_selector 'h1', text: newsletter.title
  end
end
