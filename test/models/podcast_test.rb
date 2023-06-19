# == Schema Information
#
# Table name: podcasts
#
#  id         :bigint           not null, primary key
#  title      :string
#  cover      :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#  featured   :boolean
#
require "test_helper"

class PodcastTest < ActiveSupport::TestCase
  attr_reader :podcast

  def setup
    @podcast = podcasts(:one)
  end

  test "should be valid" do
    assert podcast.valid?
  end

  test "title should be present" do
    podcast.title = ""
    assert_not podcast.valid?
  end

  test "content should be present" do
    podcast.content = nil
    assert_not podcast.valid?
  end

  test "url should be present" do
    podcast.url = ""
    assert_not podcast.valid?
  end

  # Add more test cases as needed

  # Example test for associations
  test "should have authors" do
    assert_respond_to podcast, :authors
  end

  # Example test for friendly_id
  test "should generate slug" do
    podcast.title = "Test Podcast"
    assert_equal "my-podcast", podcast.slug
  end
end
