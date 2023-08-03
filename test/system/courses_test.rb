require "application_system_test_case"

class CoursesTest < ApplicationSystemTestCase
  attr_reader :course

  def setup
    @course = courses(:one)
  end

  test "should display the title" do
    visit courses_url
  
    assert_selector "h1", text: "Courses"
  end

  test "should display course details" do
    visit course_url(course)
    
    assert_selector 'h1', text: course.title
  end
end
