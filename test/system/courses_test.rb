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

  test "should search courses with search term" do
    visit courses_path
    assert_selector "h1", text: "Courses about Ruby and Ruby on Rails"

    assert_selector "h3", text: course.title

    serach_course_title(course.title)
    assert_equal true, page.has_content?("Search Term: #{course.title}")

    assert_selector "h3", text: course.title
  end

  test "should not show invalid results" do
    visit courses_path
    assert_selector "h1", text: "Courses about Ruby and Ruby on Rails"

    assert_selector "h3", text: course.title

    serach_course_title('invalid')
    assert_equal true, page.has_content?("Search Term: invalid")

    # Page should not have that course
    refute_selector "h3", text: course.title
  end

  private

  def serach_course_title(title)
    fill_in 'search_term', with: title
    click_button 'Search'
  end
end
