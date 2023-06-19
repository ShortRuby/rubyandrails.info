# == Schema Information
#
# Table name: lessons
#
#  id         :bigint           not null, primary key
#  title      :string
#  url        :string
#  youtube_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#
require "test_helper"

class LessonTest < ActiveSupport::TestCase
  attr_reader :lesson

  def setup
    @lesson = lessons(:first)
  end
  test 'should be valid' do
    assert lesson.valid?
    assert_empty lesson.errors
  end

  test 'should require title' do
    @lesson.title = ''
    assert_not lesson.valid?
  end

  test 'should require url' do
    @lesson.url = ''
    assert_not lesson.valid?
  end

  test 'should require description' do
    @lesson.description = nil
    assert_not lesson.valid?
  end

  test 'should have a next lesson' do
    next_lesson = lessons(:second)
    assert_equal next_lesson, lesson.next
  end

  test 'should have a previous lesson' do
    prev_lesson = lessons(:zeroth)
    assert_equal prev_lesson, lesson.prev
  end
end
