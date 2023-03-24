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
class Course < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_rich_text :content

  has_many :taggings, as: :taggable, dependent: :destroy
  has_many :tags, through: :taggings

  has_many :authorings, as: :authorabble, dependent: :destroy
  has_many :authors, through: :authorings

  validates :title, :content, presence: true

  def cover_path
    "courses/#{cover}"
  end

  def self.ransackable_attributes(auth_object = nil)
    ["id", "title"]
  end
end
