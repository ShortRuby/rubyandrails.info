# == Schema Information
#
# Table name: courses
#
#  id              :bigint           not null, primary key
#  title           :string
#  content         :text
#  free            :boolean
#  courseSiteTitle :string
#  courseSiteUrl   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  slug            :string
#  cover           :string
#
require "test_helper"

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
