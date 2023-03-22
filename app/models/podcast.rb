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
class Podcast < ApplicationRecord
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
