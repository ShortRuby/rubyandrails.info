require "test_helper"

class CourseTest < ActiveSupport::TestCase
  attr_reader :course

  def setup
    @course = courses(:one)
  end

  test "when title and content is provided is valid" do
    assert course.valid?
  end

  test "when title is missing is invalid" do
    course.title = " "
    assert_not course.valid?
  end

  test "when content is missing is invalid" do
    course.content = " "
    assert_not course.valid?
  end

  test "responds_to cover_path" do
    assert_respond_to course, :cover_path
  end

  test "builds cover_path from cover" do
    course.cover = "hello.jpg"
    assert_equal "courses/hello.jpg", course.cover_path
  end

  test "id and title are set as ransackable attributes" do
    assert_equal ["id", "title"], Course.ransackable_attributes
  end
end
