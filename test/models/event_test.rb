# == Schema Information
#
# Table name: events
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :string
#  date        :string
#  url         :string
#  active      :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string
#
require "test_helper"

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
