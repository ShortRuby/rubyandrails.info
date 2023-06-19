# == Schema Information
#
# Table name: screencasts
#
#  id         :bigint           not null, primary key
#  title      :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#
require "test_helper"

class ScreencastTest < ActiveSupport::TestCase
  attr_reader :screencast

  def setup
    @screencast = screencasts(:first)
  end

  test 'should be valid' do
    assert screencast.valid?
  end
end
