require "application_system_test_case"

class CommunitiesTest < ApplicationSystemTestCase
  attr_reader :community

  def setup
    @community = communities(:one)
  end

  test "should display the title" do
    visit communities_path
    assert_selector "h1", text: "Communities"
  end

  test "should display community details" do
    visit community_path(community)
    
    assert_selector 'h1', text: community.title
  end

  test "should search communities with search term" do
    visit communities_path
    assert_selector "h1", text: "Communities"

    assert_selector "h2", text: community.title

    serach_community_title(community.title)
    assert_equal true, page.has_content?("Search Term: #{community.title}")

    assert_selector "h2", text: community.title
  end

  test "should not show invalid results" do
    visit communities_path
    assert_selector "h1", text: "Communities"

    assert_selector "h2", text: community.title

    serach_community_title('invalid')
    assert_equal true, page.has_content?("Search Term: invalid")

    # Page should not have that community
    refute_selector "h2", text: community.title
  end

  private

  def serach_community_title(title)
    fill_in 'search_term', with: title
    click_button 'Search'
  end
end
