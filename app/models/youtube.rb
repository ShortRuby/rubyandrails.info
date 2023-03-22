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
class Youtube < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :authorings, as: :authorabble, dependent: :destroy
  has_many :authors, through: :authorings

  has_many :taggings, as: :taggable, dependent: :destroy
  has_many :tags, through: :taggings

  has_many :lessons, dependent: :destroy

  validates :title, :url, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["id", "title"]
  end
end
