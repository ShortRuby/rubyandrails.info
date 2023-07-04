require "application_system_test_case"

class AuthorsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit authors_url
  
    assert_selector "h1", text: "People"
  end
end
