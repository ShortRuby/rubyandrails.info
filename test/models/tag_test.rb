# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#
require "test_helper"

class TagTest < ActiveSupport::TestCase
  attr_reader :tag

  def setup
    @tag = tags(:tag_one)
  end

  test 'should be valid' do    
    assert tag.valid?
    assert_empty tag.errors
  end
end
