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
  # test "the truth" do
  #   assert true
  # end
end
