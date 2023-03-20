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
class Tag < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :taggings, dependent: :destroy
  has_many :books, through: :taggings, source: :taggable, source_type: "Book"
  has_many :courses, through: :taggings, source: :taggable, source_type: "Course"
  has_many :youtubes, through: :taggings, source: :taggable, source_type: "Youtube"

  def self.ransackable_attributes(auth_object = nil)
    ["id", "title"]
  end
end
