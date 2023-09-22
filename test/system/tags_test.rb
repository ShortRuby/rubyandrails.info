require "application_system_test_case"

class TagsTest < ApplicationSystemTestCase
  attr_reader :tag

  def setup
    @tag = tags(:tag_one)
  end

  test "should display the title" do
    visit tags_url
  
    assert_selector "h1", text: "What would you like to learn more about?"
  end

  test "should display tag details" do
    visit tag_url(tag)
    
    assert_selector 'h1', text: tag.title.capitalize
  end

  test "should search tags with search term" do
    visit tags_path
    assert_selector "h1", text: "What would you like to learn more about?"

    assert_selector 'a', text: tag.title

    search_with_name(tag.title)
    assert_equal true, page.has_content?("Search Term: #{tag.title}")

    assert_selector 'a', text: tag.title
  end 

  test "should not show invalid results" do
    visit tags_path
    assert_selector "h1", text: "What would you like to learn more about?"

    assert_selector 'a', text: tag.title

    search_with_name('invalid')
    assert_equal true, page.has_content?("Search Term: invalid")

    # Page should not have that tag
    refute_selector "a", text: tag.title
  end
end
