# == Schema Information
#
# Table name: newsletters
#
#  id                 :bigint           not null, primary key
#  title              :string
#  url                :string
#  description        :string
#  slug               :string
#  featured           :boolean
#  author             :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  featured_cover     :string
#  testimonial_text   :string
#  testimonial_author :string
#  testimonial_link   :string
#
require "test_helper"

class NewsletterTest < ActiveSupport::TestCase
  attr_reader :newsletter

  def setup
    @newsletter = newsletters(:one)
  end

  test 'should be valid' do
    assert newsletter.valid?
  end

  test 'title should be present' do
    newsletter.title = ''
    assert_not newsletter.valid?
    assert_includes newsletter.errors[:title], "can't be blank"
  end

  test 'content should be present' do
    newsletter.content = ''
    assert_not newsletter.valid?
    assert_includes newsletter.errors[:content], "can't be blank"
  end

  test 'url should be present' do
    newsletter.url = ''
    assert_not newsletter.valid?
    assert_includes newsletter.errors[:url], "can't be blank"
  end
end
