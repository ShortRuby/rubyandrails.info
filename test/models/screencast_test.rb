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
  # test "the truth" do
  #   assert true
  # end
end
