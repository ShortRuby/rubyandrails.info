require "application_system_test_case"

class YoutubesTest < ApplicationSystemTestCase
  attr_reader :youtube_course

  def setup
    @youtube_course = youtubes(:youtube_zero)
  end

  test "should display the title" do
    visit youtubes_url
  
    assert_selector "h1", text: "YouTube Courses"
  end

  test "should display youtube course details" do
    visit youtube_url(youtube_course)
    
    assert_selector 'h1', text: youtube_course.title
  end
end
