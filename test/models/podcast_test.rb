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
  # test "the truth" do
  #   assert true
  # end
end
