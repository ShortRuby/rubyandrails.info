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
end
