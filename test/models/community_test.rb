# == Schema Information
#
# Table name: communities
#
#  id          :bigint           not null, primary key
#  title       :string
#  cover       :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  url         :string
#  slug        :string
#  source      :integer
#
require "test_helper"

class CommunityTest < ActiveSupport::TestCase
  attr_reader :community

  def setup
    @community = communities(:one)
  end

  test 'should be valid' do
    assert community.valid?
  end

  test 'should have a title' do
    @community.title = ''
    assert_not community.valid?
  end

  test 'should have a URL' do
    community.url = ''
    assert_not community.valid?
  end
end
