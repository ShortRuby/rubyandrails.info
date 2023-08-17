require "application_system_test_case"

class ScreencastsTest < ApplicationSystemTestCase
  attr_reader :screencast

  def setup
    @screencast = screencasts(:first)
  end

  test "should display the title" do
    visit screencasts_url
  
    assert_selector "h1", text: "Screencasts about Ruby and Ruby on Rails"
  end

  test "should display screencast details" do
    visit screencast_url(screencast)
    
    assert_selector 'h1', text: screencast.title
  end

  test "should search Screencasts with search term" do
    visit screencasts_url
    assert_selector "h1", text: "Screencasts about Ruby and Ruby on Rails"

    assert_selector "h3", text: screencast.title

    serach_screencast_title(screencast.title)
    assert_equal true, page.has_content?("Search Term: #{screencast.title}")

    assert_selector "h3", text: screencast.title
  end

  test "should not show invalid results" do
    visit screencasts_url
    assert_selector "h1", text: "Screencasts about Ruby and Ruby on Rails"

    assert_selector "h3", text: screencast.title

    serach_screencast_title('invalid')
    assert_equal true, page.has_content?("Search Term: invalid")

    # Page should not have that screencast
    refute_selector "h3", text: screencast.title
  end

  private

  def serach_screencast_title(title)
    fill_in 'search_term', with: title
    click_button 'Search'
  end
end
