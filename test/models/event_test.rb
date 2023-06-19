# == Schema Information
#
# Table name: events
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :string
#  date        :string
#  url         :string
#  active      :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string
#
require "test_helper"

class EventTest < ActiveSupport::TestCase
  attr_reader :event

  def setup
    @event = events(:one)
  end

  test "should be valid" do
    assert event.valid?
  end

  test "title should be present" do
    event.title = " "
    assert_not event.valid?
    assert_includes event.errors[:title], "can't be blank"
  end

  test "description should be present" do
    event.description = " "
    assert_not event.valid?
    assert_includes event.errors[:description], "can't be blank"
  end

  test "url should be present" do
    event.url = " "
    assert_not event.valid?
    assert_includes event.errors[:url], "can't be blank"
  end
end
