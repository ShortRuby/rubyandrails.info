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
class Newsletter < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_rich_text :content

  has_many :authorings, as: :authorabble, dependent: :destroy
  has_many :authors, through: :authorings

  validates :title, :content, :url, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["id", "title"]
  end
end
