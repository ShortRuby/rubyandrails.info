# == Schema Information
#
# Table name: youtubes
#
#  id          :bigint           not null, primary key
#  title       :string
#  cover       :string
#  description :string
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string
#
require "test_helper"

class YoutubeTest < ActiveSupport::TestCase
  attr_reader :youtube

  def setup
    @youtube = youtubes(:youtube_one)
  end

  test 'should be valid' do
    assert youtube.valid?
    assert_empty youtube.errors
  end

  test 'should require title' do
    youtube.title = ''
    assert_not youtube.valid?
  end

  test 'should require url' do
    youtube.url = ''
    assert_not youtube.valid?
  end

  test 'should have authors' do
    author = Author.create(name: 'Author Name')
    youtube.authors << author
    assert_includes youtube.authors, author
  end

  test 'should have tags' do
    tag = Tag.create(title: 'test')
    youtube.tags << tag
    assert_includes youtube.tags, tag
  end

  test 'should have lessons' do
    lesson = Lesson.create(title: 'Lesson Title', description: 'Lesson description', url: 'https://example.com/lesson', youtube: youtube)
    assert_includes youtube.lessons, lesson    
  end
end
