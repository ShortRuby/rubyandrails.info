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
  # test "the truth" do
  #   assert true
  # end
end
