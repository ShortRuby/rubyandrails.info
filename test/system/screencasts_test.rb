require "application_system_test_case"

class ScreencastsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit screencasts_url
  
    assert_selector "h1", text: "Screencasts about Ruby and Ruby on Rails"
  end
end
