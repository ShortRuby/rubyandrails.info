require "application_system_test_case"

class NewslettersTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit newsletters_url
  
    assert_selector "h1", text: "Newsletters about Ruby and Ruby on Rails"
  end
end
