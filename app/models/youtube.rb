class Youtube < ApplicationRecord
  extend FriendlyId 
  friendly_id :title, use: :slugged

  has_many :authorings, as: :authorabble, dependent: :destroy
  has_many :authors, through: :authorings

  has_many :taggings, as: :taggable, dependent: :destroy
  has_many :tags, through: :taggings

  has_many :lessons, dependent: :destroy

  validates :title, :url, presence: true

end
