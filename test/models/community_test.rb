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
  # test "the truth" do
  #   assert true
  # end
end
